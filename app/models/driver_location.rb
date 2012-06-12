class DriverLocation < ActiveRecord::Base
  
  has_one :location, :as => :locatable
  belongs_to :driver
  
  validates_presence_of :driver
end