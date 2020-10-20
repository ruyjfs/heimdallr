defmodule Heimdallr.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:name, :string)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:date, :date)
      add(:gender, :integer)
      add(:password, :string)
      add(:inserted_at, :datetime)
      add(:updated_at, :datetime)
      add(:deleted_at, :datetime)
    end
  end
end
