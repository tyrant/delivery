class Item < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :restaurant
  has_many :photos, :as => :photoable
  
  validates_presence_of :name
  
end