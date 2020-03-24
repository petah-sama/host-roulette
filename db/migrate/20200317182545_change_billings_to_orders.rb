class ChangeBillingsToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :billings, :orders
  end
end
