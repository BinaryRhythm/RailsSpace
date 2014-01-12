class StatusController < ApplicationController
  def store
    @titles = "publish status"
    @user = User.find_by_screen_name(session[:user_id])
    @user.status ||= Status.new
    @status = @user.status

    if param_posted?(:status)
      if @user.status.update_attributes!(params[:status])
        flash[:notice] = "Status saved."
      end
    end
  end

  def show
  end
end
