class Status < ActiveRecord::Base
  attr_accessible :state,:good,:read_numbers,:republish_numbers,:created_at,:updated_at
  belongs_to :user
  
  NUMBERS = %w(good,read_numbers,republish_numbers)
   
  validates_length_of :state,:maximum => DB_TEXT_MAX_LENGTH
  
   def initialize
    super
    NUMBERS.each do |numb|
      self[numb] = 0
    end
  end
  
end
