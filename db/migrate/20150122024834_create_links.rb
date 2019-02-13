class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.boolean :new_window
      t.integer :order
      t.boolean :show_in_footer

      t.timestamps
    end
  end
end
