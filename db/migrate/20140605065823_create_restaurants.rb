class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.integer :recipe_id

      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.string :phone4
      t.string :phone5

      t.timestamps
    end
  end
end
