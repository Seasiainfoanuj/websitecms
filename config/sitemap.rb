host ENV["RAILS_DEFAULT_HOST"]

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
end

sitemap_for Page.visible_to_public, name: :pages do |page|
  url page_url(slug: page.slug), last_mod: page.updated_at, priority: 1.0
end

sitemap_for Post.visible_to_public, name: :posts do |post|
  url post_url(slug: post.slug), last_mod: post.updated_at, priority: 1.0
end

sitemap_for Vehicle.visible_to_public, name: :vehicles do |vehicle|
  url vehicle_url(slug: vehicle.slug), last_mod: vehicle.updated_at, priority: 1.0
end

sitemap_for Product.visible_to_public, name: :products do |product|
  url product_url(category_slug: product.categories.first.slug, product_slug: product.slug), last_mod: product.updated_at, priority: 1.0
end

# Ping search engines after sitemap generation:
ping_with "http://#{host}/sitemap.xml"
