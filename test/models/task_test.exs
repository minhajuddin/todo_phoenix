defmodule Todo.TaskTest do
  use Todo.ModelCase

  alias Todo.Task

  @valid_attrs %{completed_at: "2010-04-17 14:00:00", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Task.changeset(%Task{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Task.changeset(%Task{}, @invalid_attrs)
    refute changeset.valid?
  end
end
