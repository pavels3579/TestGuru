class AddAnswersDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :correct, from: nil, to: 0)
  end
end
