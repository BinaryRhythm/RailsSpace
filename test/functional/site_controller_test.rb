require File.dirname(__FILE__)+'/../test_helper'

require 'site_controller'

class SiteController
	def rescue_action(e)
	       	raise e 
	end
end

class SiteControllerTest < ActionController::TestCase

  def test_index 
    get :index
    title = assigns(:titles)
    assert_equal "Welcome to RailsSpace!",title
    assert_response :success
    assert_template "index"
  end

  def test_about
    get :about
    title = assigns(:titles)
    assert_equal "About RailsSpace",title
    assert_response :success
    assert_template "about"
  end

  def test_help
    get :help
    title = assigns(:titles)
    assert_equal "RailsSpace Help",title
    assert_response :success
    assert_template "help"
  end
  def setup
	  @controller = SiteController.new
	  @request = ActionController::TestRequest.new
	  @response = ActionController::TestResponse.new
  end

  def test_registration_page
	  get :register
	  title = assigns(:title)
	  assert_equal "Register",title
	  assert_response :success
	  assert_template "register"
<<<<<<< HEAD
=======
	  assert_tag "form", :attributes => {:action=>"/user/register",
	  :method=>"post"}

	  assert_tag "input",:attributes => {:name => "user[email]",
	  :type => "text",
	  :size => User::PASSWORD_SIZE,
	  :maxlength => User::PASSWORD_MAX_LENGTH }

	  assert_tag "input",
		      :attributes => {}
>>>>>>> 14e5f790dcfbf1a15f9466e2dc203cb282c925eb
  end

  def test_truth
	  assert true
  end
end
