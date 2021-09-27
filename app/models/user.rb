class User < ApplicationRecord
  has_many :issues, class_name: :Test, foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password, presence: true

  def test_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    TestPassage.where('test_id = ?', test.id).order(id: :desc).first
  end
end
