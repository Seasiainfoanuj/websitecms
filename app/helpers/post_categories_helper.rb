module PostCategoriesHelper
  def nested_post_categories(post_categories)
    post_categories.map do |post_category, sub_post_categories|
      render(post_category) + nested_post_categories(sub_post_categories)
    end.join.html_safe
  end

  def nested_post_categories_select(post_categories, post)
    post_categories.map do |post_category, sub_post_categories|
      content_tag(:div, render('category_fields', category: post_category, post: post) + nested_post_categories_select(sub_post_categories, post), class: "category-select-field")
    end.join.html_safe
  end

  def nested_post_categories_widget_list(post_categories)
    post_categories.map do |post_category, sub_post_categories|
      content_tag(:ul, render('shared/widgets/post_category_aside_widget_items', category: post_category) + nested_post_categories_widget_list(sub_post_categories), class: "nested-category-list")
    end.join.html_safe
  end
end
