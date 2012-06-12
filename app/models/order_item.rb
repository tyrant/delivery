class OrderItem < ActiveRecord::Base
  
  belongs_to :item
  belongs_to :restaurant_order
  
  validates_numericality_of :price
end