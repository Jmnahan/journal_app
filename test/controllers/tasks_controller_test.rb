require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get category_tasks_path(@category)
    assert_response :success
  end

  test "should get new" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test "should get show" do
    get category_task_path(@category, @task)
    assert_response :success
  end
  
  test "should post create" do
    post category_tasks_path(@category), params: { task: { title: "Testing one", content: "test content" } }
    assert_response :redirect
  end

  test "should patch edit" do
    patch category_task_path(@category, @task), params: { task: { title: "This is title", content: "This is content" }}
    assert_response :redirect
  end

  test "should destroy delete" do
    delete category_task_path(@category, @task)
    assert_response :redirect
  end
end
