class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests, dependent: :destroy

  def select_by_level(level)
    # Test.joins('INNER JOIN user_tests ON tests.id = user_tests.test_id')
    #    .where("user_id = ? AND level = ?", id, level)
    Users.find_by(id: id).tests.where(level: level)
  end
end
