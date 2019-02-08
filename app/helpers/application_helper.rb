module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    author+repo
  end

  def flash_mes(type)
    {
      notice: "alert-info",
      alert: "warning"
    }[type.to_sym]

  end

end
