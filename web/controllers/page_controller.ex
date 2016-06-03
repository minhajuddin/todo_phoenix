defmodule Todo.PageController do
  use Todo.Web, :controller

  def index(conn, _params) do
    conn = assign(conn, :age, 31)
    render conn, "index.html", name: "Khaja"
  end
end
