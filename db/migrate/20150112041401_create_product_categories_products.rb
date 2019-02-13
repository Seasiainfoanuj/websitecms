class CreateProductCategoriesProducts < ActiveRecord::Migration
  def change
    create_table :product_categories_products, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :product_category, index: true
    end
  end
end
