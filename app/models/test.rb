class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests, dependent: :destroy

  def self.select_by_category_name(category_name)
    # Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
    #.where("categories.title = ?", category_name)
    Category.find_by(title: category_name).tests
        .order(title: :desc)
        .pluck(:title)
  end
end
