require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save task without name" do
    task = Task.new
    task.description = "test"
    assert_not task.save, "Saved catergory without name"
  end

  test "should not save task without description" do
    task = Task.new
    task.name = "testing"
    assert_not task.save, "Saved catergory without description"
  end

  test "should not save task with name less that 5 characters" do
    task = Task.new
    task.name = "test"
    task.description = "test"
    assert_not task.save, "Saved catergory with name less that 5 characters"
  end
end
