# defmodule Heimdallr.UserManager.User do
#   use Ecto.Schema
#   import Ecto.Changeset

#   schema "users" do
#     field :name, :string
#     field :email, :string
#     field :bio, :string
#     field :first_name, :string
#     field :last_name, :string
#     field :date, :date
#     field :gender, :integer
#     field :password, :string

#     timestamps()
#   end

#   @doc false
#   def changeset(user, attrs) do
#     user
#     |> cast(attrs, [:email, :password])
#     |> validate_required([:email, :password])
#   end

#   defp put_password_hash(
#          %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
#        ) do
#     change(changeset, password: Argon2.hash_pwd_salt(password))
#   end

#   defp put_password_hash(changeset), do: changeset
# end
