class PostCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :post_categories_posts, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :post_category, index: true
    end
  end
end
