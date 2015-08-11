module ApplicationHelper
  def container_color(the_color)
    content_for(:container_color, the_color.to_s)
  end
end
