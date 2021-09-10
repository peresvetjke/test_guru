class User < ApplicationRecord
  has_many :issues, class_name: :Test, foreign_key: :author_id
  has_many :assessments
  has_many :tests, through: :assessments

  validates :login, :email, presence: true

  scope :test_level, -> (level) { Test.joins(:users).where("tests.level = ?", level) }

  def test_level(level)
    User.test_level(level).where("assessments.user_id = ?", id)
  end
end
