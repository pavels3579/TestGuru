class User < ApplicationRecord

  def find_tests(level)
    UserTest.find_by(user_id: self.id,
                     test_id: (Test.where(level: level).select(:id)))
  end
end
