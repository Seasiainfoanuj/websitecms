class Page < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  validates :title, :slug, :template, :status, :visibility, presence: true
  validates :slug, uniqueness: true

  scope :published, -> { where(status: "published") }
  scope :visible_to_public, -> { where(visibility: "public").where(status: "published") }

  STATUSES = %i[draft published]
  VISIBILITIES = %i[public private]

  # Hardcoded page layout templates
  TEMPLATES = %i[default homepage hire contact_us]

  def self.search(search)
    if search
      where('title like :search or content like :search', search: "%#{search}%")
    else
      scoped
    end
  end
end
