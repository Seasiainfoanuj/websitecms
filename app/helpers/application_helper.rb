module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-primary", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def file_name_from_url(url)
    url[0..-5].split('/').last
  end

  def embed(youtube_id)
    content_tag(:iframe, nil, src: "https://www.youtube.com/embed/#{youtube_id}")
  end

  def image_base_url(content)
    # replace redundant links and also use full url
    content.gsub(/(http)?s?:?(\/\/)?www.bus4x4.com.au\/media/, "#{ENV["RAILS_ASSET_HOST"]}/media")
      .gsub("\"/media","\"#{ENV["RAILS_ASSET_HOST"]}/media")
  end
end
