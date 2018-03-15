require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(username: "simon", email: "simon@test.com", password: "password")
	end

	test "user should be valid" do
		assert @user.valid?
	end

	test "username should be present" do
		@user.username = " "
		assert_not @user.valid?
	end

	test "username should be unique" do
		@user.save
		user2 = User.new(username: "simon")
		assert_not user2.valid?
	end

	test "username should not be too long" do
		@user.save
		user3 = User.new(username: "a" * 51, email: "abc@abc.com", password: "password")
		assert_not user3.valid?
	end

	test "username should not be too short" do
		@user.save
		user4 = User.new(username: "a" * 2, email: "def@def.com", password: "password")
		assert_not user4.valid?
	end


end