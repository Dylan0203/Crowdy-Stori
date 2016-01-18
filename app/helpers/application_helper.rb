module ApplicationHelper

  def chapters_filter(options)
    params.slice(:order, :category, :keyword).merge(options)
  end

  def api_image_path(path)
    request.protocol + request.host_with_port + path
  end
end
