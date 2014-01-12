class ApplicationController < ActionController::Base
  # protect_from_forgery

  include ApplicationHelper
  before_filter :check_authorization
  # sssession :session_key => '_rails_test_session_id'
  def check_authorization
    authorization_token = cookies[:authorization_token]
    if authorization_token and logged_in?
      user = User.find_by_authorization_token(authorization_token)
      user.login!(session) if user
    end
  end

  def param_posted?(symbol)
    request.post? and params[symbol]
  end

  # def protect
  # unless logged_in?
  # session[:current_uri] = request.request_uri
  # flash[:notice] = "Please login first"
  # redirect_to :controller => "user",:action => "login"
  # return false
  # end
  # end

  def protect
    unless logged_in?
      session[:current_uri] = request.original_url
      flash[:notice] = "Please login firsted!"
      redirect_to :action => "login",:controller => "user"
    return false
    end
  end

 def redirect_to_user_index
   redirect_to :action => "index",:controller => "user"
 end
end
