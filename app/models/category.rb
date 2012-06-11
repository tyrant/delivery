class Category < ActiveRecord::Base
  
  acts_as_tree :order => 'title'
  has_many :items
  
  validates_presence_of :title
end