class CommentController < ApplicationController
  def index
    redirect_to_user_index
  end

  def store
     if param_posted?(:comment)
       
     end
  end

  def show
  end
end
