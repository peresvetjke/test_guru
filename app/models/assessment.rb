class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :test

  enum status: [:active, :finished]
end
