class FaqController < ApplicationController
  before_filter :protect
  
  def index
    redirect_to_user_index
  end

  def edit
    @titles = "Edit FAQ"
    @user = User.find_by_screen_name(session[:user_id])
    @user.faq ||= Faq.new
    @faq = @user.faq
    if param_posted?(:faq)
      if @user.faq.update_attributes!(params[:faq])
        flash[:notice] = "FAQ saved."
        redirect_to_user_index
      end
    end
  end

  # def protect
    # unless session[:user_id]
      # flash[:notice] = "Please login firsted!"
      # redirect_to :action => "login",:controller => "user"
    # return false
    # end
  # end
  
end
