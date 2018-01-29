class DropBalanceLogs < ActiveRecord::Migration[5.1]
  def change
    drop_table :balance_logs
  end
end
