module QuestionsHelper
  def question_header(question, method_name)
    test = Test.find(question.test_id)
    method_name+' '+test.title+' Question'

  end
end
