class Gallery < ActiveRecord::Base
  has_many :slides, dependent: :destroy

  validates :name, :gallery_type, :shortcode, presence: true
  validates :shortcode, uniqueness: true

  accepts_nested_attributes_for :slides, allow_destroy: true

  TYPES = %i[photo_gallery video_gallery product_gallery]

  def self.search(search)
    if search
      where('name like :search', search: "%#{search}%")
    else
      scoped
    end
  end
end
