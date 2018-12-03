class Slide < ActiveRecord::Base
  default_scope  { order(order: :asc) }

  belongs_to :gallery

  validates :gallery_id, :slide_type, presence: true

  mount_uploader :image, SlideUploader

  TYPES = %i[image youtube vimeo]
end
