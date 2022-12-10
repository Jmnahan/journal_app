require "test_helper"

class TaskTest < ActiveSupport::TestCase

  setup do
    @category = categories :one
    @task = tasks :one
    @current = DateTime.now                      
  end

  test "should not save task without title" do
    task = Task.new
    task.content = @task.content
    task.category_id = @category.id
    task.priority = Date.parse "2024-1-1"
    assert_not task.save, "Saved task without title"
  end

  test "should not save task without content" do
    task = Task.new
    task.title = @task.title
    task.category_id = @category.id
    task.priority = Date.parse "2024-1-1"
    assert_not task.save, "Saved task without content"
  end

  test "should not save task with content less that 10 characters" do
    task = Task.new
    task.title = @task.title
    task.content = "test"
    task.category_id = @category.id
    task.priority = Date.parse "2024-1-1"
    assert_not task.save, "Saved task with content less that 10 characters"
  end

  test "should not save task without priority" do
    task = Task.new
    task.title = @task.title
    task.content = "test"
    task.category_id = @category.id
    assert_not task.save, "Saved task without priority"
  end

  test "priority date should not be in the past" do
    task = Task.new
    task.title = @task.title
    task.content = @task.content
    task.category_id = @category.id
    task.priority = Date.parse "2000-1-1"
    if task.priority < @current
      assert_not task.save, "Saved task even if priority is in the past"
    end    
  end
end
