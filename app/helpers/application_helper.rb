module ApplicationHelper
  def page_title(page_title = '')
    base_title = '星空マップ'
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end
end
