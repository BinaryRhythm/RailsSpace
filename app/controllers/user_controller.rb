class UserController < ApplicationController
  include ApplicationHelper

  helper :profile,:avatar
  #include ProfileHelper
  
  before_filter :protect,:except => [:login,:register] 

  def index
    @titles = "RailsSpace User Hub"
    @user = User.find_by_screen_name(session[:user_id])  #ser.find(session[:user_id])
    
    @sepc = @user.spec ||= Spec.new 
    @faq = @user.faq ||= Faq.new
    # @status = @user.status ||= Status.new
    # @avatar = @user.avatar ||= Avatar.new
  end

  def register
    @titles = "Register"
    if param_posted?(:user)
      @user = User.new(params[:user])
      if @user.save
        # render :text => "User created!"
        # session[:user_id] = @user.screen_name
        @user.login!(session)
        flash[:notice] = "#{@user.screen_name} created!"
        redirect_to_forwarding_url
      else
      @user.clear_psd!
      end
    end
  end

  def login
    @titles = "Login to RailsSpace" 
    
    if request.get?
      @user = User.new(:remember_me=>cookies[:remember_me] || "0")
    elsif param_posted?(:user)
      @user = User.new(params[:user])
    end
    
    if param_posted?(:user)
      @user = User.new(params[:user])
      user = User.find_by_screen_name_and_password(@user.screen_name,@user.password)
      if user
        #session[:user_id] = user.screen_name
        #flash[:notice] = "#{user.screen_name}"
        user.login!(session)
        if @user.remember_me == "1"
          cookies[:remember_me] = {:value=>"1",:expires=>10.years.from_now}
          user.authorization_token = user.id
          user.save!
          cookies[:authorization_token] = {:value=>user.authorization_token,:expires=>10.years.from_now}
        else
          cookies.delete(:remember_me)
          cookies.delete(:authorization_token)
        end
        redirect_to_forwarding_url
      else
      # @user.password = nil
        @user.clear_psd!
        flash[:notice] = "Invalid screen name/password combination"
      end
    end
  end

  def logout
    User.logout!(session,cookies)
    flash[:notice] = "Logged out"
    redirect_to :action => "index",:controller => "site"
    return
  end

  def redirect_to_forwarding_url
    if(redirect_url = session[:current_url])
      session[:current_url] = nil
      redirect_to redirect_url
    else
      redirect_to :action => "index"
    end
  end
   
  def edit
     @titles = "Edit basic info"
     @user = User.find_by_screen_name(session[:user_id])
     if param_posted?(:user)
       attribute = params[:attribute]
       case attribute
           when "email"
             try_to_update @user,attribute
           when "password"
             if @user.correct_password?(params)
               try_to_update @user,attribute
             else
               @user.password_errors(params)
               flash[:notice] = "current password invalid."
             end
       end
     end
     @user.clear_psd!
  end
  
  def try_to_update(user,attribute)
    if user.update_attributes(params[:user])
      flash[:notice] = "User #{attribute} updated."
      redirect_to :action => "index"
    else
      flash[:notice] = "update #{attribute} failed."
    end
  end 
  
  
end
