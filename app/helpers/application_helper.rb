module ApplicationHelper
  def container_color(the_color)
    content_for(:container_color, the_color.to_s)
  end

  def container_id(the_id)
    content_for(:container_id, the_id.to_s)
  end
end
