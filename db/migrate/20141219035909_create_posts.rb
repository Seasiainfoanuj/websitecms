class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.string :status
      t.string :visibility
      t.integer :order
      t.text :content
      t.text :meta_description
      t.text :meta_keywords
      t.belongs_to :author, index: true
      t.datetime :published_on

      t.timestamps
    end

    add_index :posts, :slug
  end
end
