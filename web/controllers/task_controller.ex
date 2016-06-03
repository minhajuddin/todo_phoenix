defmodule Todo.TaskController do
  use Todo.Web, :controller
  alias Todo.Repo
  alias Todo.Task

  def index(conn, _params) do
    render conn, :index, tasks: Repo.all(Task)
  end

  def new(conn, _params) do
    render conn, :new
  end

  def create(conn, %{"title" => title}) do
    Repo.insert!(%Task{title: title})
    conn
    |> redirect(to: "/")
  end

  def update_status(conn, %{"status" => status, "id" => id}) do
    task = Repo.get! Task, id
    task = case status do
      "complete" ->
        Ecto.Changeset.change task, completed_at: Ecto.DateTime.utc
      "incomplete" ->
        Ecto.Changeset.change task, completed_at: nil
    end

    Repo.update! task
    conn
    |> redirect(to: "/")
  end
end

