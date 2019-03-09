class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  def try_get_badge
    badges = Badge.all

    badges.each do |b|
      if b.rule_name == 'category'
        tests = Test.select_by_category_title(b.rule_value)
        user_tests = current_user.tests.select_by_category(b.rule_value)

        if tests.ids.sort == Array(user_tests).map(&:to_i).sort
          give_badge(b)
        end
      end

      if b.rule_name == 'level'
        tests = Test.select_by_level(b.rule_value)
        user_tests = current_user.tests.select_by_level(b.rule_value).where(success?)

        if tests.ids.sort == Array(user_tests).map(&:to_i).sort
          give_badge(b)
        end
      end

      if b.rule_name == 'success_first_try'
        last_test = TestPassage.where(user: current_user).last.test
        first_test = TestPassage.where(user: current_user, test: last_test).first
        user_tests = current_user.tests.select_by_level(b.rule_value).where(success?)

        if tests.ids.sort == Array(user_tests).map(&:to_i).sort
          give_badge(b)
        end
      end

    end
  end

  def give_badge(badge)
    medal = UserBadge.new
    medal.user = current_user
    medal.badge = badge
    medal.save!
  end

end


def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end
