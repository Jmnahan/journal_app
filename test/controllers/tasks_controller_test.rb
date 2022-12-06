require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(email: "testing@example.com", password: "password")
    @category = Category.create(name: "This is category", user: user )
    @task = Task.create(title: "Task title", 
                        content: "Task content", 
                        category_id: @category.id, 
                        priority: "January 1 2023",
                        user: user )          
    get '/users/sign_in'
    sign_in user
    post user_session_url                   
  end

  test "should get new" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end
  
  test "should create task" do
    post category_tasks_path(@category, @task), params: { task: { title: "Testing one", 
                                                                  content: "test content", 
                                                                  category_id: @category.id, 
                                                                  priority: (Date.parse "2024-1-1") } }
    assert_response :redirect
  end

  test "should edit task" do
    patch category_task_path(@category, @task), params: { task: { title: "This is title", content: "This is content" }}
    assert_response :redirect
  end

  test "should destroy task" do
    delete category_task_path(@category, @task)
    assert_response :redirect
  end

  test "should go to all tasks from create task" do
    assert_difference("Task.count") do
      post category_tasks_path(@category), params: { task: { title: "Title this", 
                                                            content: "Content this", 
                                                            category_id: @category.id, 
                                                            priority: (Date.parse "2024-1-1") } }
    end

    follow_redirect!
    assert_response :success
  end

  test "should go to all tasks from update task" do
    patch category_task_path(@category, @task), params: { task: { title: "Title this", content: "Content this", category_id: 1 } }
    assert_redirected_to category_path(@category)
  end

  test "should go to all tasks from destroy task" do
    assert_difference("Task.count", - 1) do
      delete category_task_path(@category, @task)
    end

    follow_redirect!
    assert_response :success
  end
end
