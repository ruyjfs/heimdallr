defmodule SkeletonElixir.Repo.Migrations.CreateAdresses do
  use Ecto.Migration

  def change do
    create table(:adresses) do
      add :name, :string
      # add :number, :string
      # add :last_name, :string
      # add :date, :date
      # add :created_at, :date
      # add :deleted_at, :date
    end
  end
end
