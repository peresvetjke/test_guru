class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  after_initialize :after_initialize_set_current_question, if: :new_record?
  after_validation :after_validation_define_next_question, on: :update, unless: :completed?
  

  PASSING_PERCENTAGE = 85.freeze
  
  def accept!(answer_ids)
    evaluate_answer(answer_ids)
    save
  end

  def evaluate_answer(answer_ids)
    answer_ids = [] if answer_ids.nil?
    self.correct_questions += 1 if self.current_question.answers.correct.pluck(:id).sort == answer_ids.map(&:to_i).sort
  end

  def success_percent
    ( self.correct_questions.to_f / self.test.questions.count ) * 100
  end

  def passed?
    success_percent >= PASSING_PERCENTAGE
  end

  def current_question_order_number
    return '-' if self.completed?
    self.test.questions.pluck(:id).sort.index(self.current_question.id) + 1
  end

  def previous_question_order_number
    return self.current_question_order_number if self.current_question_order_number == 1
    return self.test.questions.count if self.completed?
    
    self.current_question_order_number - 1 
  end

  def completed?
    current_question.nil?
  end

  def progress(previous = false)
    question_order_number = previous ? previous_question_order_number : current_question_order_number

    if self.completed? && previous == false
      100
    else
      (((question_order_number - 1) / self.test.questions.count.to_f) * 100).ceil
    end
  end

  def prev_progress
    prev_question_order_number = self.current_question_order_number - 1
    (((prev_question_order_number - 1) / self.test.questions.count.to_f) * 100).ceil 
  end

  private

  def after_initialize_set_current_question
    self.current_question = test.questions.order(id: :asc).first
  end

  def after_validation_define_next_question
    self.current_question = test.questions.where('id > ?', self.current_question).order(id: :asc).first
  end
end
