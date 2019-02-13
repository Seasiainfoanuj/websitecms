class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.string :template
      t.string :status
      t.string :visibility
      t.integer :order
      t.text :content
      t.text :meta_description
      t.text :meta_keywords
      t.datetime :published_on

      t.timestamps
    end

    add_index :pages, :slug
  end
end
