class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.integer :restaurant_id
      t.string :image_url

      t.timestamps
    end
  end
end
