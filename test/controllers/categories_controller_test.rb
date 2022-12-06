require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(email: "testing@example.com", password: "password")
    @category = Category.create(name: "This is name", user: @user )
    get '/users/sign_in'
    sign_in @user
    post user_session_url
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "should create category" do
    post categories_path(@category), params: { category: {name: "Test123654" } }
    assert_response :redirect
  end

  test "should edit category" do
    patch category_path(@category), params: { category: {name: "Test123654" } }
    assert_response :redirect
  end

  test "should destroy category" do
    delete category_path(@category)
    assert_response :redirect
  end

  test "should go to root path from post category" do
    assert_difference("Category.count") do
      post categories_url, params: { category: {name: "Test123654" } }
    end

    follow_redirect!
    assert_response :success
  end

  test "should go to categories from update category" do
    patch category_path(@category), params: { category: {name: "AnotherTest" } }
    assert_redirected_to categories_path
  end

  test "should go to categories from destroy category" do
    assert_difference("Category.count", - 1) do
      delete category_path(@category)
    end

    follow_redirect!
    assert_response :success
  end

end
