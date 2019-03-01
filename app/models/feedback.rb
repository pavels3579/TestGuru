class Feedback
  include ActiveModel::Model

  attr_accessor :title, :body, :user

  validates :title, :body, :user, presence: true

  def deliver
    FeedbacksMailer.feedback(@title, @body, @user).deliver_now if valid?
  end
end
