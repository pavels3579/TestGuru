class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  belongs_to :author, class_name: "Users"

  def self.select_by_category_name(category_name)
    Test.joins(:category)
        .where(categories: { title: category_name })
        .order({title: :desc })
        .pluck(:title)
  end
end
