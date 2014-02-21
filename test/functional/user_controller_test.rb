require 'test_helper'

class UserControllerTest < ActionController::TestCase
<<<<<<< HEAD
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

=======
  def test_registration_page 
    get :register
    title = assigns(:title)
    assert_equal "Register",title
    assert_response :success
    assert_template "register"
    
    assert_tag "form",:attributes => {:action => "/user/register",
                                      :method => "post" }
    assert_tag "input",:attributes => {:name => "user[screen_name]",
                                       :type => "text",
                                       :size => User::SCREEN_NAME_SIZE,
                                       :maxlength =>User::SCREEN_NAME_MAX_LENGTH}
    assert_tag "input",
	     :attributes => {:name => "user[email]",
                             :type => "text",
                             :size => User::EMAIL_SIZE,
                             :maxlength => User::EMAIL_MAX_LENGTH }
    assert_tag "input",
	    :attributes => {:name => "user[password]",
                            :type => "password",
                            :size => User::PASSWORD_SIZE,
                            :maxlength => User::PASSWORD_MAX_LENGTH }
    assert_tag "input",:attributes => { :type => "submit",:value => "Register!" }
  end


  def test_registration_success 
    post :register,:user => {
         :screen_name => "new_screen_name",
	 :email => "valid@example.com",
	 :password => "long_enough_password"
    }
    user = assigns(:user)
    assert_not_nil user
   
    new_user = User.find_by_screen_name_and_password(user.screen_name, 
						     user.password)
    assert_equal new_user,user
    assert_equal "User #{new_user.screen_name} created!",flash[:notice]
    assert_redirected_to :action => "index"   
    assert_response :success
  end
  
  def test_registration_failure
     post :register,:user => {:screen_name => "aa/noyes",
     :email => "anoyes@exap,com",:password => "sun" }
     assert_response :success
     assert_template "register"
     assert_tag "div", :attributes => {:id => "errorExplanation",
	     :class => "errorExplanation" }
     assert_tag "li",:content => /Screen name/
     assert_tag "li",:content => /Email/
     assert_tag "li",:content => /Password/

     error_div = {:tag => "div",:attributes => {:class => "field_with_errors" }}
     assert_tag "input",
	    :attributes => {:name => "user[screen_name]",
            :value => "aa/noyes"},
	   :parent => error_div
    assert_tag "input",:attributes => {
                                :name => "user[email]",
                                :value => "anoyes@exap,com"},
			:parent => error_div
    assert_tag "input",
               :attributes => {:name => "user[password]",
                               :value => "sun"},
		   :parent => error_div	       

  end
>>>>>>> 14e5f790dcfbf1a15f9466e2dc203cb282c925eb
end
