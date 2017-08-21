class CreateExercices < ActiveRecord::Migration[5.1]
  def change
    create_table :exercices do |t|
      t.string :title
      t.text :begining_story
      t.text :end_story
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
