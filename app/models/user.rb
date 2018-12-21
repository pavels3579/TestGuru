class User < ApplicationRecord
  def select_by_level(level)
    TEST.joins('INNER JOIN user_tests ON tests.id = user_tests.test_id')
        .where("user_id = ? AND level = ?", id, level)
  end
end
