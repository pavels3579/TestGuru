class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    # alter_table :tests do |t|
    #   t.belongs_to(:category, foreign_key:true)
    # end
    # add_reference :tests, :category, index: true
    add_foreign_key :tests, :categories

  end
end
