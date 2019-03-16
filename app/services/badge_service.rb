class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def try_get_badge
    return [] unless @test_passage.success

    Badge.all.select { |badge| send(badge.rule_name, badge.rule_value) }
  end

  def category(rule_value)
    return false unless @test.category.title = rule_value

    user_successfull_tests.where(category_id: @test.category_id).uniq.count == Test.select_by_category(@test.category.title).count
  end

  def level(rule_value)
    user_successfull_tests.where(level: @test.level).uniq.count == Test.select_by_level(rule_value.to_i).count
  end

  def success_first_try(rule_value)
    user_successfull_tests.where(id: @test.id).count == 1
  end

  def user_successfull_tests
   @user.tests.merge(TestPassage.where(success: true))
  end

end
