defmodule Heimdallr.Repo.User do
  import Ecto.Query, warn: false

  alias Heimdallr.Repo
  alias Heimdallr.Schema.User

  def find(id), do: Repo.get(User, id)

  def list(), do: Repo.all(User)

  def list(params), do: Repo.all(User, params)

  def create(attrs) do
    attrs
    |> User.changeset()
    |> Repo.insert()
  end

  # def create(params, _info) do
  #   User.create_user(params)
  # end

  # def create_user(attrs \\ %{}) do
  #   %User{}
  #   |> User.changeset(attrs)
  #   |> Repo.insert()
  # end

  @doc false
  # def changeset(attrs) do
  #   %__MODULE__{}
  #   |> changeset(attrs)
  # end

  @doc false
  # def changeset(%__MODULE__{} = user, attrs) do
  #   attrs =
  #     attrs
  #     |> Map.put(:password, Argon2.hash_pwd_salt(attrs.password))

  #   user
  #   |> cast(attrs, [:name, :password])
  #   |> validate_required([:name, :password])
  # end

  # def create_user(attrs) do
  #   attrs
  #   |> Schemas.User.changeset()
  #   |> Repo.insert()
  # end

  # defp do_create_user(attrs) do
  #   attrs
  #   |> Accounts.User.changeset()
  #   |> Repo.insert()
  # end

  # def create_user(attrs) do
  #   {contact_attrs, user_attrs} = Map.pop(attrs, :contact)

  #   Repo.transaction(fn ->
  #     with {:ok, contact} <- create_contact(contact_attrs),
  #          {:ok, user} <- do_create_user(user_attrs, contact) do
  #       %{user | contacts: [contact]}
  #     end
  #   end)
  # end

  # def create_contact(attrs) do
  #   attrs
  #   |> Accounts.Contact.changeset()
  #   |> Blog.Repo.insert()
  # end

  # defp do_create_user(attrs, contact) do
  #   attrs
  #   |> Map.put(:contact_id, contact.id)
  #   |> Accounts.User.changeset()
  #   |> Blog.Repo.insert()
  # end

  def authenticate(email, plain_text_password) do
    query = from u in User, where: u.email == ^email

    case Repo.one(query) do
      nil ->
        Argon2.no_user_verify()
        {:error, :invalid_credentials}

      user ->
        if Argon2.verify_pass(plain_text_password, user.password) do
          {:ok, user}
        else
          {:error, :invalid_credentials}
        end
    end
  end
end
