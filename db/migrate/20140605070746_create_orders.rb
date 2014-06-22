class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :recipe_id
      t.datetime :attend_time

      t.timestamps
    end
  end
end
