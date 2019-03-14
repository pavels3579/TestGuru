class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badge = nil
    @badges = []
  end

  def try_get_badge
    badges = Badge.all

    badges.each do |b|
      @badge = b
      send(b.rule_name, b.rule_value)
    end
    @badges
  end

  def category(rule_value)
    if @test.category.title = rule_value
      tests_count = Test.select_by_category(rule_value).count
      #user_tests_count = @user.tests.select_by_category(rule_value).where(success: true).count
      user_tests_count = @user.tests.select_by_category(rule_value).where('test_passages.success = ?', true).count

      if tests_count == user_tests_count
        #give_badge
        @badges << @badge
        #give_badge(Badge.first)
      end
    end
  end

  def level(rule_value)
    tests_count = Test.select_by_level(rule_value.to_i).count
    #user_tests_count = @user.tests.select_by_level(rule_value).where(success: true).count
    #user_tests_count = TestPassage.where(user_id: @user.id, success: true).preload(:test).select_by_level(rule_value.to_i).count
    #user_tests_count = TestPassage.where(user_id: @user.id, success: true).joins(Test.select_by_level(rule_value)).count
    user_tests_count = TestPassage.where(user_id: @user.id, success: true).joins(:test).where('tests.level = ?', rule_value.to_i).uniq.count

    if tests_count == user_tests_count
      #give_badge
      @badges << @badge
    end
  end

  def success_first_try(rule_value)
    #give_badge if (@user.tests.where(test_id: @test.id).count == 1 && @user.tests.where(test_id: @test.id, success: true).count == 1)
    #give_badge if (TestPassage.where(test_id: @test.id, user_id: @user.id).count == 1 && TestPassage.where(test_id: @test.id, user_id: @user.id, success: true).count == 1)
    @badges << @badge if (TestPassage.where(test_id: @test.id, user_id: @user.id).count == 1 && TestPassage.where(test_id: @test.id, user_id: @user.id, success: true).count == 1)
  end

  def give_badge
    medal = UserBadge.new
    medal.user = @user
    medal.badge = @badge
    medal.save!
  end

end
