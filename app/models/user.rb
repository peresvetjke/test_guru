class User < ApplicationRecord
  has_many :assessments
  has_many :tests, through: :assessments

  def tests_by_level(level)
    Test.joins(:users).where("users.id = ? and tests.level = ?", id, level)
  end
end
