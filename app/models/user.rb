class User < ApplicationRecord
  has_many :assessments
  has_many :tests, through: :assessments
end
