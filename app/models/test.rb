class Test < ApplicationRecord
  belongs_to :category
  has_many :assessments
  has_many :users, through: :assessments
end
