require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "This is name")
    @task = Task.create(title: "Task title", content: "Task content", category_id: @category.id)
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

  # test "should go to all tasks from post task" do
  #   assert_difference("Category.count") do
  #     post category_tasks_path(@category), params: { task: { title: "Title this", content: "Content this", category_id: 1 } }
  #   end

  #   follow_redirect!
  #   assert_response :success
  # end

  # test "should go to all tasks from update task" do
  #   patch category_task_path(@category, @task), params: { task: { title: "Title this", content: "Content this", category_id: 1 } }
  #   assert_redirected_to category_tasks_path
  # end

  # test "should go to all tasks from destroy task" do
  #   assert_difference("Category.count", - 1) do
  #     delete category_task_path(@category, @task)
  #   end

  #   follow_redirect!
  #   assert_response :success
  # end
end
