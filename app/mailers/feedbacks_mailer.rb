class FeedbacksMailer < ApplicationMailer

  def feedback(title, body, user)
    mail(
      #to: Admin.first.email,
      to: 'pavels3579@gmail.com',
      subject: "Feedback from #{user} with title: #{title}",
      body: body
    )
  end
end
