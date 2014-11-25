module ApplicationHelper

  def full_title(page_title = '')
    base_title = Constant.app_title
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
  #  css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    
    if column == sort_column
      image_name = direction == "asc" ? "arrow_down.png" : "arrow_up.png"
      link_to raw("#{title} #{image_tag(image_name)}") ,  params.merge(:sort => column, :direction => direction, :page => nil)
    else
      link_to title, params.merge(:sort => column, :direction => direction, :page => nil)
    end

  end

  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
