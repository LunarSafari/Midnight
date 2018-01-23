class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :goal_id
      t.datetime :began_at
      t.datetime :ended_at
      t.integer :type
      t.integer :user_id
      t.timestamps
    end
  end
end
