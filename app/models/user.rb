class User < ApplicationRecord
  has_many :issues, class_name: :Test, foreign_key: :author_id
  has_many :assessments
  has_many :tests, through: :assessments

  validates :login, :email, presence: true

  scope :test_level, -> (level) { Test.joins(:assessments).where("tests.level = ?", level) }

  def test_level(level)
    tests.where(level: level)
  end
end
