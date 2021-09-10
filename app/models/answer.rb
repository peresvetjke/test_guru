class MyValidator < ActiveModel::Validator
  def validate(record)
    max_amount = 4
    if record.question.answers.count > max_amount
      record.errors.add :base, "Превышено кол-во ответов (максимальное значение - #{max_amount})"
    end
  end
end

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates_with MyValidator

  scope :correct, -> { where(correct: true) }
end