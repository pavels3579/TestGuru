class AddForeignKeyUserTests < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :user_tests, :users, column: :user_id
    add_foreign_key :user_tests, :tests, column: :test_id
    add_index(:user_tests, :user_id)
    add_index(:user_tests, :test_id)
  end
end
