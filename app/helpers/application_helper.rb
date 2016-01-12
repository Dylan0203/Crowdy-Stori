module ApplicationHelper

  def chapters_filter(options)
    params.slice(:order, :category, :keyword).merge(options)
  end

end
