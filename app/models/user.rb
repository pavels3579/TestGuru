class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: "Test",
            foreign_key: "author_id", dependent: :nullify

  validates :email, presence: true

  def select_by_level(level)
    # tests.where(level: level)
    tests.select_by_level(level)
  end
end
