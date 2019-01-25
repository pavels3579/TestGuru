module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    author+repo
  end

  def flash_mes(class_name)
    content_tag :p, flash[:alert], class: "#{class_name}"
  end

end
