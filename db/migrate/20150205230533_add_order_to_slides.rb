class AddOrderToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :order, :integer, after: :thumb_text
  end
end
