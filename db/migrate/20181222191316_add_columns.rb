class AddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column(:answers, :user_id, :integer, null: false)
    add_column(:tests, :author_id, :integer, null: false)

    add_foreign_key :answers, :users
    add_foreign_key :tests, :users, column: :author_id
    add_index(:answers, :user_id)
    add_index(:tests, :author_id)
  end
end
