class SiteController < ApplicationController
<<<<<<< HEAD
 
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
=======
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
  
>>>>>>> 14e5f790dcfbf1a15f9466e2dc203cb282c925eb
end
