class AddRatioToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ratio, :float, default: 1
    rename_column :balance_logs, :rate, :ratio
  end
end
