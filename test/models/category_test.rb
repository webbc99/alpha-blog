require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	def setup
		@category = Category.new(name: "sports")
	end

	test "category should be valid" do
		assert @category.valid?
	end

	test "name should be present" do
		@category.name = " "
		assert_not @category.valid?
	end

	test "name should be unique" do
		@category.save
		category2 = Category.new(name: "sports")
		assert_not category2.valid?
	end

	test "name should not be too long" do
		@category.save
		category3 = Category.new(name: "a" * 26)
		assert_not category3.valid?
	end

	test "name should not be too short" do
		@category.save
		category4 = Category.new(name: "a" * 2)
		assert_not category4.valid?
	end


end