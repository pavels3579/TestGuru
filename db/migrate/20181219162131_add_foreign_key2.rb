class AddForeignKey2 < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
       t.belongs_to(:category, foreign_key:true)
    end
  end
end
