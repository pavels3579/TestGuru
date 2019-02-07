module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    author+repo
  end

  def flash_mes(type)
    if type.to_s == 'notice'
      'alert alert-info'
    elsif type.to_s == 'primary'
      'alert alert-primary'
    elsif type.to_s == 'warning'
      'alert alert-warning'
    elsif type.to_s == 'danger'
      'alert alert-danger'
    elsif type.to_s == 'success'
      'alert alert-success'
    else
      'alert alert-info'
    end
  end

end
