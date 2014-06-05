class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :QQ
      t.string :weixin
      t.string :wangwang

      t.timestamps
    end
  end
end
