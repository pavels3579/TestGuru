class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:user_path]
        redirect_to session[:user_path]
      else
        redirect_to tests_path
      end
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      #flash_mes('Are you a Guru? Verify your Email and Password please')
      render :new
    end
  end

  def delete; end

  def destroy
    #signout
    session[:user_id] = nil
    cookies.delete(:user_id)
    redirect_to tests_path
  end

end
