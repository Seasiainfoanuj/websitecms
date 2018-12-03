class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :gallery_type
      t.string :shortcode
      t.timestamps
    end

    add_index :galleries, :shortcode
  end
end
