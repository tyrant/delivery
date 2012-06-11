class Customer < ActiveRecord::Base
  
  has_many :customer_orders
  belongs_to :location, :as => :locatable
  
end