class ChangAnswersBodyType < ActiveRecord::Migration[5.2]
  def change
    change_table :answers do |t|
      t.change :body, :string
    end
  end
end
