class AddPhotoToExercice < ActiveRecord::Migration[5.1]
  def change
    add_column :exercices, :photo, :string
  end
end
