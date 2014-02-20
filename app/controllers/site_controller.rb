class SiteController < ApplicationController
 
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
end
