class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.belongs_to :gallery, index: true
      t.string :slide_type
      t.string :image
      t.string :embedded_url
      t.text :thumb_text
      t.timestamps
    end
  end
end
