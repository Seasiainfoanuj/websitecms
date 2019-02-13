class CreateRelatedVehicles < ActiveRecord::Migration
  def change
    create_table :related_vehicles do |t|
      t.belongs_to :vehicle, index: true
      t.belongs_to :related_vehicle, index: true
      t.timestamps
    end
  end
end
