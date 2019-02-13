class AddOrderToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :order, :integer, after: :visibility
  end
end
