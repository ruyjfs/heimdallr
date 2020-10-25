defmodule HeimdallrWeb.Resolvers.Auth do
  alias Heimdallr.Repo.User
  # alias Heimdallr.Guardian

  def login(_parent, args, %{context: %{}}) do
    # {:ok, jwt, _claims} = Guardian.encode_and_sign(%{:name => "Ruy"}, :access)
    # _ -> %{token: jwt}
    # test = Guardian.encode_and_sign(%{:name => "Ruy"}, :access)
    # with {:ok, user} <- Enum.fetch(User.find(email: args.email), 0),
    # case Guardian.encode_and_sign(User.find(25), :access) do
    #   nil -> {:error, "An Error occured creating the token"}
    #   {:ok, token, full_claims} -> {:ok, %{token: token}}
    # end

    # with {:ok, user} <- Heimdallr.UserManager.authenticate_user(args.email, args.password),
    #      true <- Argon2.verify_pass(args.password, user.password) do
    with {:ok, user} <- User.authenticate(args.email, args.password) do
      IO.inspect(user)
      IO.inspect("=====")

      case Guardian.encode_and_sign(Heimdallr.Guardian, user) do
        nil ->
          {:error, "An Error occured creating the token"}

        {:error, :secret_not_found} ->
          {:error, "secret_not_found"}

        {:ok, token, full_claims} ->
          {:ok, %{token: token}}
          # _ -> {:error, "secret_not_found"}
      end

      # IO.inspect(user)

      # IO.inspect(Guardian.encode_and_sign(user, %{some: "claim"}))

      # {:ok, %{:token => "TOKEN-HAHAHA"}}
    else
      _ -> {:error, "User or password invalid!"}
    end
  end

  def login(_parent, _args, _resolution), do: {:error, "Access danied"}
end
