class AddAddressToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :province, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :county, :string
    add_column :restaurants, :address, :string
  end
end
