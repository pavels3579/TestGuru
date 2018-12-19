class AddForeignKey3 < ActiveRecord::Migration[5.2]
  def change
    # add_foreign_key :tests, :categories, column: :category_id
    # add_index :tests, :category_id

    add_foreign_key :questions, :tests, column: :test_id
    add_foreign_key :answers, :questions, column: :question_id
  end
end
