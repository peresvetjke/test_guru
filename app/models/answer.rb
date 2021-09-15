class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :max_answer_per_question, on: :create

  scope :correct, -> { where(correct: true) }

  def max_answer_per_question
    max_amount = 4
    if self.question.answers.count >= max_amount
      errors.add :base, "Превышено кол-во ответов (максимальное значение - #{max_amount})"
    end
  end
end