class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      #flash_mes('Are you a Guru? Verify your Email and Password please')
      render :new
    end
  end

  def delete; end

  def destroy
    sign_out
    redirect_to tests_path
  end

end
