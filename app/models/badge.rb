class Badge < ApplicationRecord
  belongs_to :rule, optional: true
  has_many :badges_awardings
  has_many :users, through: :badges_awardings

  validates :title, presence: true

=begin
  def rule_assigned?
    !self.rule.nil?
  end

  def active=(value)
    return false if value && !self.rule_assigned?
    self.active = value
  end
=end
end
