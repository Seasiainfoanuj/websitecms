module VehicleFiltersHelper
  def nested_vehicle_filters(vehicle_filters)
    vehicle_filters.map do |vehicle_filter, sub_vehicle_filters|
      render(vehicle_filter) + nested_vehicle_filters(sub_vehicle_filters)
    end.join.html_safe
  end

  def nested_vehicle_filter_links(vehicle_filters)
    vehicle_filters.map do |vehicle_filter, sub_vehicle_filters|
      content_tag(:li, link_to(vehicle_filter.title, "#", data: {filter: vehicle_filter.data_filter}) + content_tag(:ul, nested_vehicle_filter_links(sub_vehicle_filters)))
    end.join.html_safe
  end
end
