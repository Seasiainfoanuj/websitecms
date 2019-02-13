class RelatedVehicle < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :related_vehicle, class_name: 'Vehicle'
end
