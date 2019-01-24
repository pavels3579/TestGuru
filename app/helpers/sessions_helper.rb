module SessionsHelper
  def sign_out
    cookies.delete(:user_id)
    #self.current_user = nil
  end
end
