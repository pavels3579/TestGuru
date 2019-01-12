class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_quuestion_not_found

  def new; end

  def index
    render inline: '<p>Questions:<br><%= @test.questions.pluck(:body) %></p>'
  end

  def show
    find_question
    render inline: '<p>Question:<br><%= @question.body %></p>'
  end

  def create
    question = Question.create(question_params)
    render plain: "Question was created: " + question.inspect
  end

  def destroy
    find_question
    Question.delete(@question) if @question
    render inline: '<p>Question <%= @question.id %> was deleted</p>'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_quuestion_not_found
    render plain: 'Question was not found'
  end

end
