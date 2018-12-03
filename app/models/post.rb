class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories, class_name: 'PostCategory'

  validates :title, :slug, :status, :visibility, presence: true
  validates :slug, uniqueness: true

  scope :published, -> { where(status: "published") }
  scope :visible_to_public, -> { where(visibility: "public").where(status: "published") }

  STATUSES = %i[draft published]
  VISIBILITIES = %i[public private]

  def self.search(search)
    if search
      where('title like :search or content like :search', search: "%#{search}%")
    else
      scoped
    end
  end
end
