class Badge < ApplicationRecord
  belongs_to :rule, optional: true
  has_many :badges_awardings
  has_many :users, through: :badges_awardings

  validates :title, :rule_id, :image_url, presence: true
  
end
