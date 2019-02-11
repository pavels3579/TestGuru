class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    #@client = client || GitHubClient.new
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    response = @client.create_gist(gist_params)
    if response.html_url.present?
      { success: response.html_url }
    else
      { success: false }
    end
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title).to_s,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

end
