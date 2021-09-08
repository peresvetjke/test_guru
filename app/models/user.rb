class User < ApplicationRecord
  has_many :issues, class_name: :Test, foreign_key: :author_id
  has_many :assessments
  has_many :tests, through: :assessments

  scope :tests_by_level, -> (level) { Test.joins(:users).where("tests.level = ?", level) }
end
