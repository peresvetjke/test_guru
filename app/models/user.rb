class User < ApplicationRecord
  has_many :assessments
  has_many :tests, through: :assessments

  def same_level_tests(level)
    id = self.id
    Test.joins(:users).where("users.id = ? and tests.level = ? and assessments.status in (0, 1)", id, level).pluck('id')
  end
end
