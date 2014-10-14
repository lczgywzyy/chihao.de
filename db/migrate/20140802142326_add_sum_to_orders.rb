class AddSumToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sum, :decimal
  end
end
