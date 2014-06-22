class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
