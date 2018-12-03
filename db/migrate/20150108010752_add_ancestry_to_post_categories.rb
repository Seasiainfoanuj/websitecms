class AddAncestryToPostCategories < ActiveRecord::Migration
  def change
    add_column :post_categories, :ancestry, :string, after: :slug
    add_index :post_categories, :ancestry
    remove_column :post_categories, :parent_id, :integer
  end
end
