class Promotion < ActiveRecord::Base
  belongs_to :changed_by, class_name: 'User'

  validates :title, uniqueness: true, presence: true
  validates :page_name, uniqueness: true, presence: true
  validates :status, :visibility, presence: true

  scope :published, -> { where(status: "published") }
  scope :visible_to_public, -> { where(visibility: "public").where(status: "published") }

  STATUSES = %i[draft published]
  VISIBILITIES = %i[public private]

end