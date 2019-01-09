class ChangeUsersColumn < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :name, :email
    end
  end
end
