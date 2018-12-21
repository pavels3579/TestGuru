class User < ApplicationRecord
  def select_by_level(level)
    TEST.joins('INNER JOIN user_tests ON tests.id = user_tests.test_id
                AND user_tests.user_id = ? AND tests.level = ?', self.id, level)
  end
end
