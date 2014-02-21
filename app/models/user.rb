class User < ActiveRecord::Base
<<<<<<< HEAD
   attr_accessible :screen_name,:email,:password,:created_at,:updated_at
=======
   has_one :spec 
   has_one :faq
   has_many :status,:order => "created_on"
   
   attr_accessor :remember_me,:current_password
   attr_accessible :screen_name,:email,:password,:created_at,:updated_at,:remember_me,:current_password,:password_confirmation
>>>>>>> 14e5f790dcfbf1a15f9466e2dc203cb282c925eb
   
   # Max & min lengths for all fields
   SCREEN_NAME_MIN_LENGTH = 4
   SCREEN_NAME_MAX_LENGTH = 20
   PASSWORD_MIN_LENGTH = 4
   PASSWORD_MAX_LENGTH = 40
   EMAIL_MAX_LENGTH = 50
   SCREEN_NAME_RANGE = SCREEN_NAME_MIN_LENGTH..SCREEN_NAME_MAX_LENGTH
   PASSWORD_RANGE = PASSWORD_MIN_LENGTH..PASSWORD_MAX_LENGTH
   
   SCREEN_NAME_SIZE = 20
   PASSWORD_SIZE = 10
   EMAIL_SIZE = 30
   
   validates_uniqueness_of  :screen_name,:email
<<<<<<< HEAD
=======
   validates_confirmation_of  :password
>>>>>>> 14e5f790dcfbf1a15f9466e2dc203cb282c925eb
   validates_length_of      :screen_name,:within => SCREEN_NAME_RANGE
   validates_length_of      :password,:within => PASSWORD_RANGE
   validates_length_of      :email,:maximum => EMAIL_MAX_LENGTH
   
   def validate
	   error.add(:email,"must be valid") unless email.include?("@")
	   if screen_name.include?(" ")
		   error.add(:screen_name,"cannot include spaces.")
	   end
   end

   validates_format_of :screen_name,
	               :with => /^[A-Z0-9]*$/i,
		       :message => "must contain only letters,numbers,underscores"
   validates_format_of :email,
	               :with => /^[A-Z0-9._%-]+@([A-Z0-9]+\.)+[A-Z]{2,4}$/i,
<<<<<<< HEAD
		       :messages => "must be a valid email address"
=======
		       :message => "must be a valid email address"

   def login!(session)
	   session[:user_id] = self.screen_name
   end

   def self.logout!(session,cookies)
	   session[:user_id] = nil
	   cookies.delete(:authorization_token)
   end

   def clear_psd!
	   self.password = nil
	   self.password_confirmation = nil
	   self.current_password = nil
   end
   
   def correct_password?(params)
    current_password = params[:user][:current_password]
    password == current_password
  end
  
  def password_errors(params)
    self.password = params[:user][:password]
    self.password_confirmation = params[:user][:password_confirmation]
    valid?
    errors.add(:current_password,"is incorrected.")
  end
  
  def name
    spec.full_name || screen_name
  end
  
  def avatar
    Avatar.ini
  end
  
>>>>>>> 14e5f790dcfbf1a15f9466e2dc203cb282c925eb
end
