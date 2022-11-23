require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "should get show" do
    get categories_path
    assert_response: success
  end
  
  test "should post create" do
    post new_categories_path, params: { name: "Monday" }
    assert_response :redirect
  end

  test "should patch edit" do
    patch edit_categories_path, params: { name: "Monday" }
    assert_response :redirect
  end

  test "should destroy delete" do
    delete delete_categories_path
    assert_response :redirect
  end
end
