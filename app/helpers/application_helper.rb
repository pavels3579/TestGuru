module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    author+repo
  end

  def flash_mes(message)
    flash.now[:alert] = message
  end
end
