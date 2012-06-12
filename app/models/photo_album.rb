class PhotoAlbum < ActiveRecord::Base
  
  belongs_to :photoable, :polymorphic => true
end