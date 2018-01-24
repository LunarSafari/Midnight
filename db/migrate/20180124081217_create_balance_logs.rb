class CreateBalanceLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :balance_logs do |t|
      t.integer :activity_id
      t.float :change
      t.float :rate
      t.timestamps
    end
  end
end
