defmodule Todo.Task do
  use Todo.Web, :model

  schema "tasks" do
    field :title, :string
    field :completed_at, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(title completed_at)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
