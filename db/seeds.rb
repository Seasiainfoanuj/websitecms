# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create first admin account

User.create(
  first_name: "First",
  last_name: "Admin",
  role: "admin",
  email: "admin@cms.com",
  password: "password",
  password_confirmation: "password"
)

PostCategory.create(name: "Uncategorized", slug: "uncategorized")
PostCategory.create(name: "News", slug: "news")
PostCategory.create(name: "Upcoming Events", slug: "upcoming-events")

ProductCategory.create(name: "Spare Parts", slug: "spare-parts")
ProductCategory.create(name: "Second Hand Vehicles", slug: "second-hand-vehicles")
ProductCategory.create(name: "Accessories", slug: "accessories")
ProductCategory.create(name: "Merchandise", slug: "merchandise")
