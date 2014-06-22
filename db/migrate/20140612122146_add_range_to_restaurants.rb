class AddRangeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :range, :string  #range: 派送范围
  end
end
