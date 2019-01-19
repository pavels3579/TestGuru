class User < ApplicationRecord
  #has_many :user_tests, dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: "Test",
            foreign_key: "author_id"

  validates :email, presence: true

  def select_by_level(level)
    tests.select_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
