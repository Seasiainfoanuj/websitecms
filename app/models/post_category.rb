class PostCategory < ActiveRecord::Base
  # belongs_to :parent, class_name: 'PostCategory'
  # has_many :child_categories, class_name: 'PostCategory', foreign_key: :parent_id
  has_ancestry

  has_and_belongs_to_many :posts

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true
end
