class RemoveRecipeIdsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :recipe_ids
  end
end
