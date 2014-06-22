class AddAvatarToRecipes < ActiveRecord::Migration
  def change
    add_attachment :recipes, :avatar
  end
end
