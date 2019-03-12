class BadgeService

  def initialize(user, test)
    @user = user
    @test = test
    @badge = nil
  end

  def try_get_badge
    badges = Badge.all

    badges.each do |b|
      @badge = b
      if b.rule_value.present?
        send(b.rule_name, b.rule_value)
      else
        send(b.rule_name)
      end
    end
  end

  def category(rule_value)
    tests_count = Test.select_by_category(rule_value).count
    #user_tests_count = @user.tests.select_by_category(rule_value).where(success: true).count
    user_tests_count = @user.tests.select_by_category(rule_value).where('test_passages.success = ?', true).count

    if tests_count == user_tests_count
      give_badge
      #give_badge(Badge.first)
    end
  end

  def level(rule_value)
    tests_count = Test.select_by_level(rule_value.to_i).count
    #user_tests_count = @user.tests.select_by_level(rule_value).where(success: true).count
    #user_tests_count = TestPassage.where(user_id: @user.id, success: true).preload(:test).select_by_level(rule_value.to_i).count
    #user_tests_count = TestPassage.where(user_id: @user.id, success: true).joins(Test.select_by_level(rule_value)).count
    user_tests_count = TestPassage.where(user_id: @user.id, success: true).joins(:test).where('tests.level = ?', rule_value.to_i).count

    if tests_count == user_tests_count
      give_badge
    end
  end

  def success_first_try
    #give_badge if (@user.tests.where(test_id: @test.id).count == 1 && @user.tests.where(test_id: @test.id, success: true).count == 1)
    give_badge if (TestPassage.where(test_id: @test.id, user_id: @user.id).count == 1 && TestPassage.where(test_id: @test.id, user_id: @user.id, success: true).count == 1)
  end

  def give_badge
    medal = UserBadge.new
    medal.user = @user
    medal.badge = @badge
    medal.save!
  end

end
