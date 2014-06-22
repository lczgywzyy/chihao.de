class AddAddressIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :province_id, :integer
    add_column :restaurants, :city_id, :integer
    add_column :restaurants, :county_id, :integer
    add_column :restaurants, :address_id, :integer
  end
end
