class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :slug
      t.integer :price_cents
      t.integer :special_price_cents
      t.text :quick_overview
      t.text :overview
      t.text :specifications
      t.boolean :sold
      t.string :visibility
      t.string :featured_image
      t.integer :gallery_id
      t.text :meta_description
      t.text :meta_keywords

      t.timestamps
    end

    add_index :products, :slug
  end
end
