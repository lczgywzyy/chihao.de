class CreateOrderSpecifications < ActiveRecord::Migration
  def change
    create_table :order_specifications do |t|
      t.integer :order_id
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :recipe_id
      t.integer :count
      
      t.timestamps
    end
  end
end
