require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should reject invalid submission" do
  	assert_no_difference 'User.count' do
  		post users_url, params: { user: { name: "", password: "", 
  																			password_confirmation: ""}}
  	end
  	assert_response :success
  end

  test "should accept valid submission" do
  	assert_difference 'User.count' do
  		post users_url, params: { user: { name: "test", password: "password",
  																			password_confirmation: "password"}}
     
  	end
  	assert_response :success
  end
end
