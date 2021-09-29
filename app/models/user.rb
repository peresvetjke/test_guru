class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
          :registerable,
          :recoverable,   
          :rememberable, 
          :validatable,
          :confirmable

  has_many :issues, class_name: :Test, foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages

#  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  validates :password, presence: true

  def test_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    TestPassage.where('test_id = ?', test.id).order(id: :desc).first
  end
end
