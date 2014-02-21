class AvatarController < ApplicationController
  before_filter :protect
  def index
    redirect_to_user_index
  end

  def upload
    @titles = "Upload Your Avatar"
    @user = User.find_by_screen_name(session[:session_id])
  end

  def delete
  end
end
