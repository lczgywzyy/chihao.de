class AddAvatarToRestaurants < ActiveRecord::Migration
  def change
    add_attachment :restaurants, :avatar
  end
end
