class AddSeatingCapacityToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :seating_capacity, :string, after: :specification
  end
end
