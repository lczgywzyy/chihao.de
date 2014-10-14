class Order < ActiveRecord::Base
  belongs_to :user
  has_many   :order_specification
  
  accepts_nested_attributes_for :order_specification
end
