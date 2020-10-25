defmodule Heimdallr.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :bio, :string
      add :first_name, :string
      add :last_name, :string
      add :date, :date
      add :gender, :integer
      add :password, :string

      timestamps()
    end

  end
end
