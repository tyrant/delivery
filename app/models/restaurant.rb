class Restaurant < ActiveRecord::Base
  
  has_many :restaurant_orders
  has_many :items
  has_many :photo_albums, :as => :photoable
  has_one :location
  
  validates_presence_of :name
end