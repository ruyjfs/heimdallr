defmodule Heimdallr.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Heimdallr.{Accounts, Content}

  schema "users" do
    field(:name, :string)
    field(:password_hash, :string)

    # Virtual fields:
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    # has_many(:posts, Content.Post, foreign_key: :author_id)
    # has_many(:contacts, Accounts.Contact)

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
  end

  @doc false
  def changeset(%__MODULE__{} = user, attrs) do
    attrs =
      attrs
      |> Map.put(:password_hash, Comeonin.Argon2.hashpwsalt(attrs.password))

    user
    |> cast(attrs, [:name, :password_hash])
    |> validate_required([:name, :password_hash])
  end
end
