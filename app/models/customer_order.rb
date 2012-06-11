class CustomerOrder < ActiveRecord::Base

  belongs_to :customer
  has_many :restaurant_orders
  
  validates_presence_of :customer
  
end