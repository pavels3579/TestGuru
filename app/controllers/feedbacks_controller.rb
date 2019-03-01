class FeedbacksController < ApplicationController
  respond_to :html

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user.email
    @feedback.deliver
    respond_with @feedback, location: root_path
  end


  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

end
