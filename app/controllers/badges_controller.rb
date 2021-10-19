class BadgesController < ApplicationController
  
  def index
    @badges = Badge.all
  end

  def awarded
    @badges = current_user.badges.uniq
  end

end