class SiteController < ApplicationController
  before_filter :protect

  layout "application"
  def index
    @titles = "Welcome to RailsSpace!"
  end

  def about
    @titles = "About RailsSpace"
  end

  def help
    @titles = "RailsSpace Help"
  end

  # def protect
    # unless session[:user_id]
      # flash[:notice] = "Please login firsted!"
      # redirect_to :action => "login",:controller => "user"
    # return false
    # end
  # end
  
end
