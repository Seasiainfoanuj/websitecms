# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160426025746) do

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.string   "gallery_type"
    t.string   "shortcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["shortcode"], name: "index_galleries_on_shortcode", using: :btree

  create_table "links", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.boolean  "new_window"
    t.integer  "order"
    t.boolean  "show_in_footer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "template"
    t.string   "status"
    t.string   "visibility"
    t.integer  "order"
    t.text     "content"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.integer  "author_id"
    t.datetime "published_on"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["author_id"], name: "index_pages_on_author_id", using: :btree
  add_index "pages", ["slug"], name: "index_pages_on_slug", using: :btree

  create_table "post_categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_categories", ["ancestry"], name: "index_post_categories_on_ancestry", using: :btree
  add_index "post_categories", ["slug"], name: "index_post_categories_on_slug", using: :btree

  create_table "post_categories_posts", id: false, force: true do |t|
    t.integer "post_id"
    t.integer "post_category_id"
  end

  add_index "post_categories_posts", ["post_category_id"], name: "index_post_categories_posts_on_post_category_id", using: :btree
  add_index "post_categories_posts", ["post_id"], name: "index_post_categories_posts_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "status"
    t.string   "visibility"
    t.integer  "order"
    t.text     "content"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.integer  "author_id"
    t.datetime "published_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", using: :btree

  create_table "product_attributes", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_attributes", ["product_id"], name: "index_product_attributes_on_product_id", using: :btree

  create_table "product_categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_categories", ["ancestry"], name: "index_product_categories_on_ancestry", using: :btree
  add_index "product_categories", ["slug"], name: "index_product_categories_on_slug", using: :btree

  create_table "product_categories_products", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "product_category_id"
  end

  add_index "product_categories_products", ["product_category_id"], name: "index_product_categories_products_on_product_category_id", using: :btree
  add_index "product_categories_products", ["product_id"], name: "index_product_categories_products_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.integer  "price_cents"
    t.integer  "special_price_cents"
    t.text     "quick_overview"
    t.text     "overview"
    t.text     "specifications"
    t.boolean  "sold"
    t.string   "visibility"
    t.string   "featured_image"
    t.integer  "gallery_id"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["slug"], name: "index_products_on_slug", using: :btree

  create_table "promotions", force: true do |t|
    t.integer  "changed_by_id"
    t.string   "page_name"
    t.string   "title"
    t.string   "status"
    t.string   "visibility"
    t.text     "feature_description"
    t.text     "testimonials"
    t.string   "feature_video_url"
    t.datetime "published_on"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "redactor_assets", force: true do |t|
    t.integer  "user_id"
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "related_vehicles", force: true do |t|
    t.integer  "vehicle_id"
    t.integer  "related_vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "related_vehicles", ["related_vehicle_id"], name: "index_related_vehicles_on_related_vehicle_id", using: :btree
  add_index "related_vehicles", ["vehicle_id"], name: "index_related_vehicles_on_vehicle_id", using: :btree

  create_table "slides", force: true do |t|
    t.integer  "gallery_id"
    t.string   "slide_type"
    t.string   "image"
    t.string   "embedded_url"
    t.text     "thumb_text"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slides", ["gallery_id"], name: "index_slides_on_gallery_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.string   "avatar"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "vehicle_filters", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "data_filter"
    t.boolean  "enabled"
    t.integer  "position"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_filters", ["ancestry"], name: "index_vehicle_filters_on_ancestry", using: :btree
  add_index "vehicle_filters", ["slug"], name: "index_vehicle_filters_on_slug", using: :btree

  create_table "vehicles", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "visibility"
    t.integer  "order"
    t.string   "make"
    t.string   "model"
    t.string   "transmission"
    t.string   "specification"
    t.string   "seating_capacity"
    t.string   "kit"
    t.boolean  "for_hire"
    t.string   "featured_image"
    t.string   "manufacturer_logo"
    t.integer  "gallery_id"
    t.text     "overview"
    t.text     "features"
    t.text     "specifications"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brochure"
  end

  add_index "vehicles", ["slug"], name: "index_vehicles_on_slug", using: :btree

end
