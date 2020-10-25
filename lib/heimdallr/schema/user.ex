defmodule Heimdallr.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :first_name, :string
    field :last_name, :string
    field :date, :date
    field :gender, :integer
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
  end

  @doc false
  def changeset(%__MODULE__{} = user, attrs) do
    # attrs =
    #   attrs
    #   |> Map.put(:password, Argon2.hash_pwd_salt(attrs.password))

    # user
    # |> cast(attrs, [:name, :password])
    # |> validate_required([:name, :password])

    user
    |> cast(attrs, [
      :name,
      :email,
      :password
    ])
    |> validate_required([:name, :email, :password])
    |> validate_length(:name, min: 3, max: 20)
    |> validate_length(:password, min: 5, max: 20)
    |> unique_constraint(:name, downcase: true)
    |> unique_constraint(:email, downcase: true)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password, Argon2.hash_pwd_salt(pass))

      _ ->
        changeset
    end
  end

  # def list_users do
  #   Repo.all(User)
  # end

  # def get_user!(id), do: Repo.get!(User, id)

  # # The tutorial calls this one:
  # def create_user(attrs \\ %{}) do
  #   %User{}
  #   |> User.changeset(attrs)
  #   |> Repo.insert()
  # end

  # def update_user(%User{} = user, attrs) do
  #   user
  #   |> User.changeset(attrs)
  #   |> Repo.update()
  # end

  # def delete_user(%User{} = user) do
  #   Repo.delete(user)
  # end

  # # The tutorial calls this one:
  # def change_user(%User{} = user) do
  #   User.changeset(user, %{})
  # end
end
