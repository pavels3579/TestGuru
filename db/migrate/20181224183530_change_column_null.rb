class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :category_id, true)
    change_column_null(:tests, :author_id, true)
    drop_table :test, if_exists: true
  end
end
