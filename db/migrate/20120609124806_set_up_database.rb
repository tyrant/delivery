class SetUpDatabase < ActiveRecord::Migration
  def up
    create_table :restaurants do |t|
      t.string :title
      t.integer :lat
      t.integer :lng
      t.timestamps
    end
    
    create_table :categories do |t|
      t.string :title
    end
    
    create_table :items do |t|
      t.string :title
      t.references :category
      t.references :restaurant
      t.timestamps
    end
    
    create_table :images do |t|
      t.string :imageable_type
      t.integer :imageable_id
    end
  end

  def down
    drop_table :restaurants
    drop_table :categories
    drop_table :items
    drop_table :images
  end
end
