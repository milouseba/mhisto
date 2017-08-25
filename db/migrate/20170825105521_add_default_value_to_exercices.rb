class AddDefaultValueToExercices < ActiveRecord::Migration[5.1]
  def change
    change_column :exercices, :status, :string, default: "pending"
  end
end
