class RestaurantOrder < ActiveRecord::Base
  
  belongs_to :customer_order
  belongs_to :restaurant
  has_many :items
  
end