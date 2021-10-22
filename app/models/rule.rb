class Rule < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badges

  validates :title, :method, presence: true
end