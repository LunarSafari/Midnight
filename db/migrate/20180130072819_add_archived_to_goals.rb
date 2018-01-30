class AddArchivedToGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :archived, :boolean, default: false
  end
end
