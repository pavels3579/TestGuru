class Test < ApplicationRecord
  def self.select_by_category_name(category_name)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id
                WHERE categories.name = ?', category_name)
  end
end
