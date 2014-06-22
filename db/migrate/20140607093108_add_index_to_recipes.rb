class AddIndexToRecipes < ActiveRecord::Migration
  def change
    add_index :recipes, [:name, :restaurant_id], unique:true
  end
end
