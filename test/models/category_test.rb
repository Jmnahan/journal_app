require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  
  setup do
    @user = User.create(email: "testing@example.com", password: "password")    
  end

  test "should not save category without name" do
    category = Category.new
    assert_not category.save, "Saved catergory without name"
  end

  test "should not save category with name less that 5 characters" do
    category = Category.new
    category.name = "test"
    assert_not category.save, "Saved catergory with name less that 5 characters"
  end

  test "category must be unique" do
    original = Category.new
    original.name = "Monday"
    original.user = @user
    duplicate = Category.new
    duplicate.name = "Monday"
    duplicate.user = @user

    assert original.save!
    assert Category.pluck(:name).include?(original.name)
    assert_not duplicate.save, "Saved duplicate category"
  end
end
