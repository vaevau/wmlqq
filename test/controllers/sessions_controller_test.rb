require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test "should get new" do
    get login_url
    assert_response :success
  end

  test "invalid login" do
    post login_url, params: { session: { name: @user.name, 
                                         password: ""} }
    assert_response :success
    assert_template 'new'
  end

  test "valid login" do
    post  login_url, params: { session: { name: @user.name,
                                          password: @user.password} }
    assert_response :success
    # assert_template
  end
end
