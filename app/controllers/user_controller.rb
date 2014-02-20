class UserController < ApplicationController
 
  def index
	  @titles = "RailsSpace User Hub"
  end

  def register
      @titles = "Register"
      if request.post? and params[:user]
	      @user = User.new(params[:user])
	      if @user.save
		     # render :text => "User created!"
                     session[:user_id] = @user.id
 		      flash[:notice] = "User #{@user.screen_name} created!"
		     redirect_to :action => "index"
	      else
		      logger.info params[:user].inspect
                      # raise params[:user].inspect
	      end
      end
  end
end
