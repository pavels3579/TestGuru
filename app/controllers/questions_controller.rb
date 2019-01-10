class QuestionsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_quuestion_not_found

  def new

  end

  def create

  end

  def show
    render plain: 'Show questions'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_quuestion_not_found
    render plain: 'Question was not found'
  end

end
