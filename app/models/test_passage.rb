class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many   :badges_awardings
  has_many   :badges, through: :badges_awardings

  after_initialize  :after_initialize_set_current_question, if: :new_record?
  after_validation  :after_validation_define_next_question, on: :update, unless: :completed?

  scope :test_passages_by_user, ->(user) { where('user_id = ?', user.id) }

  PASSING_PERCENTAGE = 85.freeze

  def accept!(answer_ids)
    evaluate_answer(answer_ids)
    save
  end

  def evaluate_result!
    self.passed = self.passed?
    save
  end

  def evaluate_answer(answer_ids)
    answer_ids = [] if answer_ids.nil?
    self.correct_questions += 1 if self.current_question.answers.correct.pluck(:id).sort == answer_ids.map(&:to_i).sort
  end

  def success_percent
    ( self.correct_questions.to_f / self.test.questions.count ) * 100
  end

  def time_elapsed?
    return false unless self.test.max_time_set?
    (Time.now - self.created_at) / 60 > self.test.max_time_min
  end

  def completed?
    current_question.nil? || time_elapsed?
  end
  
  private

  def passed?
    return false if time_elapsed?
    success_percent >= PASSING_PERCENTAGE
  end

  private

  def after_initialize_set_current_question
    self.current_question = test.questions.order(id: :asc).first
  end

  def after_validation_define_next_question
    self.current_question = test.questions.where('id > ?', self.current_question).order(id: :asc).first
  end
end
