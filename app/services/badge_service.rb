class BadgeService

  def initialize(user)
    @user = user
  end

  def try_get_badge
    badges = Badge.all

    badges.each do |b|
      if b.rule_value
        send(b.rule_name)
      else
        send(b.rule_name, b.rule_value)
      end

    end
  end


  def category(rule_value)
    tests = Test.select_by_category_title(rule_value)
    user_tests = @user.tests.select_by_category(rule_value).where(success: true)

    if tests.ids.sort == Array(user_tests).map(&:to_i).sort
      give_badge(b)
      #give_badge(Badge.first)
    end
  end

  def level(rule_value)
    tests = Test.select_by_level(rule_value)
    user_tests = @user.tests.select_by_level(rule_value).where(success: true)

    #if tests.ids.sort == Array(user_tests).map(&:to_i).sort
      #give_badge(b)
      give_badge(Badge.first)
    #end
  end

  def success_first_try
    give_badge(Badge.first)
    last_test = TestPassage.where(user: @user).last.test
    first_test = TestPassage.where(user: @user, test: last_test).first
    user_tests = @user.tests.select_by_level(rule_value).where(success: true)

  end

  def give_badge(badge)
    medal = UserBadge.new
    medal.user = @user
    medal.badge = badge
    medal.save!
  end

end
