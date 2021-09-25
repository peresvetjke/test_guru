class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  after_initialize :after_initialize_set_current_question, if: :new_record?
  after_initialize :after_initialize_set_correct_answers, if: :new_record?
  after_validation :after_validation_define_next_question, on: :update, unless: :completed?
  

  PASSING_PERCENTAGE = 85.freeze
  
  def accept!(answer_ids)
    evaluate_answer(answer_ids)
    save
  end

  def evaluate_answer(answer_ids)
    self.correct_questions += 1 if self.current_question.answers.correct.pluck(:id).sort == answer_ids.map(&:to_i).sort
  end

  def success_percent
    ( self.correct_questions.to_f / self.test.questions.count ) * 100
  end

  def passed?
    success_percent >= PASSING_PERCENTAGE ? true : false
  end

  def current_question_order_number
    return '-' if self.completed?
    self.test.questions.pluck(:id).sort.index(self.current_question.id) + 1
  end

  def completed?
    current_question.nil?
  end

  private

  def after_initialize_set_current_question
    self.current_question = test.questions.order(id: :asc).first
  end

  def after_initialize_set_correct_answers
    self.correct_questions = 0
  end

  def after_validation_define_next_question
    self.current_question = test.questions.where('id > ?', self.current_question).order(id: :asc).first
  end
end
