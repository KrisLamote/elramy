defmodule Demo.Repo.Migrations.Messages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :message, :string
    end
  end
end
