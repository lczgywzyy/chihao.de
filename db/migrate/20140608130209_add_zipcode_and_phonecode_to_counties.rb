class AddZipcodeAndPhonecodeToCounties < ActiveRecord::Migration
  def change
    add_column :counties, :zipcode,   :string
    add_column :counties, :phonecode, :string

  end
end
