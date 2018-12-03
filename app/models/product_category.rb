class ProductCategory < ActiveRecord::Base
  has_ancestry

  has_and_belongs_to_many :products
  has_many :custom_attributes, through: :products

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true
end
