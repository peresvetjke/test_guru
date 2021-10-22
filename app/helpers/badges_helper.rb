module BadgesHelper
  def amount(badge)
    badge.recurrent == true ? "X #{BadgesAwarding.where(badge: badge, user: current_user).count}" : ''
  end
end