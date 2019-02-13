class AddGalleryIdToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :gallery_id, :integer, after: :manufacturer_logo
  end
end
