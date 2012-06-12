class Customer < ActiveRecord::Base
  
  has_many :customer_orders
  has_one :location, :as => :locatable
  
end