class Photo < ActiveRecord::Base
  
  belongs_to :photo_album
  belongs_to :location, :as => :locatable
  
  validates_presence_of :in_album
end