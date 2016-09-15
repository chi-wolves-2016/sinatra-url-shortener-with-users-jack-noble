module Authorizable
  def logged_in?
    if session[:user_id]
      return true
    end
  end

  def current_user
    @user = User.find(session[:user_id])
  end

  def fully_authorized
    if @url.creator_id == session[:user_id]
      return true
    end
  end

end

helpers Authorizable
