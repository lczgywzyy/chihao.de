class ChangeRecipeIdToRecipeIds < ActiveRecord::Migration
  def change
    rename_column :orders, :recipe_id, :recipe_ids
    change_column :orders, :recipe_ids, :string
  end
end
