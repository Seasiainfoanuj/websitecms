class AddBrochureToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :brochure, :string
  end
end
