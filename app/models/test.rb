class Test < ApplicationRecord
  def self.select_by_category_name(category_name)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id')
        .where("categories.title = ?", category_name)
        .order(title: :desc)
        .pluck(:title)
  end
end
