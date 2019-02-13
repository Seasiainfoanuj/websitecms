class CreateVehicleFilters < ActiveRecord::Migration
  def change
    create_table :vehicle_filters do |t|
      t.string :title
      t.string :slug
      t.string :data_filter
      t.boolean :enabled
      t.integer :position
      t.string :ancestry, index: true

      t.timestamps
    end

    add_index :vehicle_filters, :ancestry
    add_index :vehicle_filters, :slug
  end
end
