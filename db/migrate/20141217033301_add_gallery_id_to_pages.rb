class AddGalleryIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :gallery_id, :integer, after: :published_on
  end
end
