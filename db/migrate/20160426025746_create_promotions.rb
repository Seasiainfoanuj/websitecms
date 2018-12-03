class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.references :changed_by
      t.string :page_name
      t.string :title
      t.string :status
      t.string :visibility
      t.text :feature_description
      t.text :testimonials
      t.string :feature_video_url
      t.datetime :published_on

      t.timestamps null: false
    end
  end
end
