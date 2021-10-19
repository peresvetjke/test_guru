class Badge < ApplicationRecord
  belongs_to :rule, optional: true
  has_many :badges_awardings
  has_many :users, through: :badges_awardings

  validates :title, :rule_id, :image_url, presence: true

  def self.badges_earned(passed_test_passage)
    new_badges = []
    Badge.all.each do |badge|
      new_badges << badge if badge.rule.condition_met?(passed_test_passage) &&
                             (BadgesAwarding.where(user: passed_test_passage.user, badge: badge).count == 0 ||
                             (BadgesAwarding.where(user: passed_test_passage.user, badge: badge).count > 0  && badge.rule.recurrent == true)) 
    end
    new_badges
  end
end
