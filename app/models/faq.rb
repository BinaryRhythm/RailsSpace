class Faq < ActiveRecord::Base
  attr_accessible :bio, :skillz, :schools, :companies, :music, :movies, :television, :books, :magazines
  belongs_to :user
  
  QUESTIONS = %w(bio skillz schools companies music movies television books magazines)
  FAVORITES = QUESTIONS - %w(bio)
  
  validates_length_of QUESTIONS ,:maximum => DB_TEXT_MAX_LENGTH
  
  
  def initialize
    super
    QUESTIONS.each do |question|
      self[question] = ""
    end
  end
end
