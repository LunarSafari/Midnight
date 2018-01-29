class AddRatioToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :ratio, :float
    add_column :activities, :duration, :float
  end
end
