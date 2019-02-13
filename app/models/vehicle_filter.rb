class VehicleFilter < ActiveRecord::Base
  # belongs_to :parent, class_name: 'VehicleFilter'
  # has_many :child_filters, class_name: 'VehicleFilter', foreign_key: :parent_id
  has_ancestry

  validates :title, :slug, presence: true
  validates :slug, uniqueness: true
end
