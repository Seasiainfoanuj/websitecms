class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.string :name
      t.string :slug
      t.belongs_to :parent, index: true

      t.timestamps
    end

    add_index :post_categories, :slug
  end
end
