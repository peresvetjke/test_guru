module BadgesHelper
  def amount(badge)
    badge.rule.recurrent == true ? "X #{BadgesAwarding.where(badge: badge, user: current_user).count}" : ''
  end
end