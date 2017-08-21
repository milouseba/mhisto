class ChangeBeginingStoryColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :exercices, :begining_story, :beginning_story
  end
end
