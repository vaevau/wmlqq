require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "test_name", password: "password",
  									 password_confirmation: "password")
  end

  test "should be vaild" do
  	assert @user.valid?, @user.errors.full_messages
  end

  test "name should be present" do
   	@user.name = ""
   	assert_not @user.valid?
  end

	test "username should have the right format" do
    %w[foo bar foobar foo_bar FooBar8].each do |username|
      @user.name = username
      assert @user.valid?, @user.name
    end
    %w[foo-bar foobar$ *bar].each do |username|
      @user.name = username
      assert_not @user.valid?, @user.name
    end
  end

	test "name should be unique" do
		duplicate_user = @user.dup
		duplicate_user.name = @user.name
		@user.save
		assert_not duplicate_user.valid?
	end

	test "name should have a maximum length" do
		@user.name = "a" * 16
		assert_not @user.valid?
	end

	test "password should be present" do 
		@user.password = @user.password_confirmation = " " * 6
		assert_not @user.valid?
	end

	test "password should have a minimum length" do
		@user.password = @user.password_confirmation = " " * 5
		assert_not @user.valid?
	end
end
