class RemoveAddressFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :province
    remove_column :restaurants, :city
    remove_column :restaurants, :county
  end
end
