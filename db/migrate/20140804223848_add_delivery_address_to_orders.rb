class AddDeliveryAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_address, :string
    add_column :orders, :delivery_mobile,  :string
    add_column :orders, :delivery_name,    :string
  end
end
