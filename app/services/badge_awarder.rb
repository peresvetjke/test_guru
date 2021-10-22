class BadgeAwarder
  METHOD_TYPES = [:level, :category, :passed_on_first_try]

  def initialize(passed_test_passage)
    @test_passage = passed_test_passage
  end

  def call
    Badge.all.each do |badge| 
      award_badge!(badge) if send("#{badge.rule.method}_award?", badge.rule.value) && badge_awardable?(badge)
    end
  end

  def award_badge!(badge)
    @test_passage.badges_awardings.create!(badge: badge, user: @test_passage.user)
  end

  private

  def level_award?(level) 
    all = Test.where(level: level)
    passed = all.tests_passed_by_user(@test_passage.user)
    all.present? && all.ids.uniq.sort == passed.ids.uniq.sort
  end

  def category_award?(category)
    all = Test.where(category: category)
    passed = all.tests_passed_by_user(@test_passage.user)
    all.present? && all.ids.uniq.sort == passed.ids.uniq.sort
  end

  def first_try_award?(value = true)
    @test_passage.passed? && TestPassage.test_passages_by_user_and_test(@test_passage.user, @test_passage.test).count == 1
  end

  def badge_awardable?(badge)
    @test_passage.user.badges.exclude?(badge) || badge.recurrent == true
  end
end 