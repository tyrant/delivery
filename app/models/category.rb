class Category < ActiveRecord::Base
  
  acts_as_tree :order => 'title'
  has_many :items
  has_many :photo_albums, :as => :photoable
  
  validates_presence_of :title
end