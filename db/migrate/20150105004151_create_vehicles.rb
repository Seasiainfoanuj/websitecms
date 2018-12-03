class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :title
      t.string :slug
      t.string :visibility
      t.string :make
      t.string :model
      t.string :transmission
      t.string :specification
      t.string :kit
      t.boolean :for_hire
      t.string :featured_image
      t.string :manufacturer_logo
      t.text :overview
      t.text :features
      t.text :specifications
      t.text :meta_description
      t.text :meta_keywords

      t.timestamps
    end

    add_index :vehicles, :slug
  end
end
