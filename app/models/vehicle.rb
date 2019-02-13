require 'file_size_validator'

class Vehicle < ActiveRecord::Base
  
  default_scope  { order(order: :asc) }

  has_many :related, :foreign_key => 'vehicle_id',
                     :class_name => 'RelatedVehicle',
                     :dependent => :destroy

  has_many :related_vehicles, :through => :related

  has_many :referenced, :foreign_key => 'related_vehicle_id',
                        :class_name => 'RelatedVehicle',
                        :dependent => :destroy

  has_many :referenced_vehicles, :through => :referenced, :source => :vehicle

  validates :title, :slug, :visibility, :featured_image, presence: true
  validates :slug, uniqueness: true

  mount_uploader :featured_image, VehicleFeaturedImageUploader
  mount_uploader :manufacturer_logo, VehicleManufacturerLogoUploader
  mount_uploader :brochure, VehicleBrochureUploader

  validates :brochure, :file_size => { :maximum => 10.megabytes.to_i} 

  scope :visible_to_public, -> { where(visibility: "public") }

  VISIBILITIES = %i[public private]

  def self.search(search)
    if search
      rows = %w[ title
                 make
                 model
                 specification
                 seating_capacity
                 overview
                 kit
               ]
      vehicle_makes = %w[isuzu toyota iveco ford autobus i-bus]
      if vehicle_makes.include?(search.downcase)
        rows = %w[ title make model ]
      end

      search_params  = {}
      hidden_params = search.split(",")

      hidden_params.each_with_index do |term, index|
        search_params["search#{index}".to_sym] = "%#{term}%"
      end

      search = hidden_params.map.with_index do |term, index|
        "(" + rows.map { |row| "#{row} like :search#{index}" }.join(" or ") + ")"
      end.join(" and ")

      vehicles = where(search, search_params)
    else
      scoped
    end
  end
end
