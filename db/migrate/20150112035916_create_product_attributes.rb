class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.belongs_to :product, index: true
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
