defmodule Heimdallr.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Heimdallr.{Accounts, Content}

  schema "users" do
    field(:name, :string)
    field(:password, :string)
    # field(:password_hash, :string)

    # Virtual fields:
    # field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    # has_many(:posts, Content.Post, foreign_key: :author_id)
    # has_many(:contacts, Accounts.Contact)

    # timestamps()
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
      |> Map.put(:password, Argon2.hash_pwd_salt(attrs.password))

    user
    |> cast(attrs, [:name, :password])
    |> validate_required([:name, :password])
  end
end
