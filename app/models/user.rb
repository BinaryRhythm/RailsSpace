class User < ActiveRecord::Base
   attr_accessible :screen_name,:email,:password,:created_at,:updated_at
   
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
		       :messages => "must be a valid email address"
end
