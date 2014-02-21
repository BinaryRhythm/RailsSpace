class SpecController < ApplicationController
  before_filter :protect
  
  def index
    redirect_to_user_index
  end

  def edit
    @titles = "Edit Spec"
    @user = User.find_by_screen_name(session[:user_id])
    @user.spec ||= Spec.new
    @spec = @user.spec
    if param_posted?(:spec)
      if @user.spec.update_attributes(params[:spec])
        flash[:notice] = "Changes saved."
        redirect_to_user_index
      end
    end
  end
  
end
