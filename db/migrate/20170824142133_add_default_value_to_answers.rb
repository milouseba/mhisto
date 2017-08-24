class AddDefaultValueToAnswers < ActiveRecord::Migration[5.1]
  def change
    change_column :answers, :status, :string, default: "pending"
  end
end
