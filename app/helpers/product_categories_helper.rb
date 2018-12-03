module ProductCategoriesHelper
  def nested_product_categories(product_categories)
    product_categories.map do |product_category, sub_product_categories|
      render(product_category) + nested_product_categories(sub_product_categories)
    end.join.html_safe
  end

  def nested_product_categories_select(product_categories, product)
    product_categories.map do |product_category, sub_product_categories|
      content_tag(:div, render('category_fields', category: product_category, product: product) + nested_product_categories_select(sub_product_categories, product), class: "category-select-field")
    end.join.html_safe
  end

  def nested_product_categories_links(product_categories)
    product_categories.map do |product_category, sub_product_categories|
      content_tag(:ul, render('store/category_links', category: product_category) + nested_product_categories_links(sub_product_categories), class: "nested-category-list")
    end.join.html_safe
  end
end
