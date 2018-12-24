class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: "Tests", dependent: :nullify

  def select_by_level(level)
    tests.where(level: level)
  end
end
