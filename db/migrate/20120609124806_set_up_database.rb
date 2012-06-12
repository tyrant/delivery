class SetUpDatabase < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.float :lat
      t.float :lng
      t.string :readable
      t.timestamps
    end
    
    create_table :customers do |t|
      t.references :location
      t.boolean :is_anonymous
      t.timestamps
    end
    
    create_table :customer_orders do |t|
      t.references :customer
      t.text :more_info
      t.timestamps
    end
    
    create_table :restaurant_orders do |t|
      t.references :customer_order
      t.timestamps
    end
    
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.references :location
      t.timestamps
    end
    
    # Food categories, that is. This can be a tree - categories have subcategories, subsubcategories, etc.
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :parent_id
      t.timestamps
    end
    
    create_table :items do |t|
      t.string :name
      t.text :description
      t.references :category
      t.references :restaurant
      t.timestamps
    end
    
    create_table :order_items do |t|
      t.references :item
      t.references :restaurant_order
      t.float :price
      t.timestamps
    end
    
    # Most other objects can have photo albums - items, restaurants, etc. Every photo
    # belongs_to an album, but unless Photo#in_album?, the album's presence won't be mentioned
    # on the website.
    create_table :photo_albums do |t|
      t.string :name
      t.string :imageable_type
      t.integer :imageable_id
      t.timestamps
    end
    
    create_table :photos do |t|
      t.references :photo_album
      t.references :location
      t.boolean :in_album 
      t.string :caption
      t.timestamps
    end
    
    create_table :drivers do |t|
      t.string :name
      t.timestamps
    end
    
    # Keeps track of a driver's path through the city over time. Useful for simulation analysis purposes.
    create_table :driver_locations do |t|
      t.references :driver
      t.references :location
      t.timestamps
    end
    
    create_table :instruction_queues do |t|
      t.references :driver
      t.string :queue_items
      t.timestamps
    end
    
    create_table :instruction_types do |t|
      t.string :description
    end
    
    # Several instruction types: go to a location and: wait until further instructions; pick up RestaurantOrder
    # A from Restaurant B; deliver A to Customer C; 
    create_table :instructions do |t|
      t.references :instruction_queue
      t.references :instruction_type
      t.references :address
      t.timestamps
    end

  end

  def down
    drop_table :locations
    drop_table :customers
    drop_table :customer_orders
    drop_table :restaurant_orders
    drop_table :restaurants
    drop_table :categories
    drop_table :items
    drop_table :order_items
    drop_table :photo_albums
    drop_table :photos
    drop_table :drivers
    drop_table :driver_locations
    drop_table :instruction_queues
    drop_table :instruction_types
    drop_table :instructions
  end
end
