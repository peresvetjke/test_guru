class BadgeAwarder

  attr_reader :errors

  def initialize(passed_test_passage)
    @test_passage = passed_test_passage
    @user = passed_test_passage.user
    @badges = Badge.all
    @errors = ''
  end

  def call
    @badges.each { |badge| award_badge!(badge) if badge_awardable?(badge) && badge_earned?(badge) }
  rescue
    @errors = 'При присвоении бэйджей возникла ошибка. Пожалуйста, обратитесь к администратору'
  end

  def award_badge!(badge)
    awarding = @test_passage.badges_awardings.create!(badge: badge, user: @test_passage.user)
  end

  private

  def badge_earned?(badge)
    if badge.rule.first_try == true
      @test_passage.passed_on_first_try?              
    else 
      all = badge.rule.relevant_tests
      passed = all.tests_passed_by_user(@user)
      !all.empty? && all.ids.sort == passed.ids.sort
    end     
  end

  def badge_awardable?(badge)
    @user.badges.exclude?(badge) || badge.rule.recurrent == true
  end
end