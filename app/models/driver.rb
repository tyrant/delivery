class Driver < ActiveRecord::Base
  
  has_many :driver_locations
  has_many :instructions
  
  validates_presence_of :name
end