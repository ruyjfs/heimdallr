defmodule SkeletonElixir.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:name, :string)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:date, :date)
      add(:gender, :string)
      add(:password, :string)
      add(:created_at, :date)
      add(:updated_at, :date)
      add(:deleted_at, :date)
    end
  end
end
