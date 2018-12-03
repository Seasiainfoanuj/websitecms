class Product < ActiveRecord::Base
  has_many :custom_attributes, class_name: 'ProductAttribute', dependent: :destroy
  accepts_nested_attributes_for :custom_attributes, allow_destroy: true
  has_and_belongs_to_many :categories, class_name: 'ProductCategory'

  validates :title, :slug, :visibility, :price_cents, :featured_image, presence: true
  validates :slug, uniqueness: true

  validate :has_at_least_one_category

  mount_uploader :featured_image, ProductFeaturedImageUploader

  scope :visible_to_public, -> { where(visibility: "public") }

  VISIBILITIES = %i[public private]

  def price
    price_cents.to_f/100 if price_cents
  end

  def price=(price)
    self.price_cents = price.to_f*100 if price
  end

  def special_price
    special_price_cents.to_f/100 if special_price_cents
  end

  def special_price=(price)
    self.special_price_cents = price.to_f*100 if price
  end

  def self.search(search)
    if search
      joins("LEFT JOIN product_attributes on products.id = product_attributes.product_id").where('title like :search or product_attributes.value like :search', search: "%#{search}%").group('products.id')
    else
      scoped
    end
  end

  private
    def has_at_least_one_category
      errors.add(:base, 'Must add at least one category') if self.categories.blank?
    end
end
