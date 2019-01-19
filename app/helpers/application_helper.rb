module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    author+repo
  end

  def test_results(correct_questions, questions_count)
    result = {}

    percent = (correct_questions*100/questions_count).round
    result[:percent] = percent
    if percent >= 85
      result[:success] = true
    else
      result[:success] = false
    end

    result
  end
end
