defmodule Demo.Message do
  use Ecto.Schema

  schema "messages" do
    field :message, :string
  end

  def changeset(message, params \\ %{}) do
    message
    |> Ecto.Changeset.cast(params, [:message])
    |> Ecto.Changeset.validate_required([:message])
  end
end
