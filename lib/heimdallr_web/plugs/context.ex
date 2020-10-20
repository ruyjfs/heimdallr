defmodule HeimdallrWeb.Plugs.Context do
  @behaviour Plug

  import Plug.Conn
  import Ecto.Query, only: [where: 2]

  alias Heimdallr.Repo
  alias Heimdallr.Accounts.User

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    # Absinthe.Plug calls Absinthe.run() with the options added to the `conn`.
    IO.inspect(context)
    IO.inspect("<<<<<<>>>>>>>>>>")
    Absinthe.Plug.put_options(conn, context: context)
  end

  @doc """
  Return the current user context based on the authorization header
  """
  def build_context(conn) do
    IO.inspect("OOOOOOIIII-<<<<<>>>>>>>>")
    IO.inspect(conn)

    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, current_user} <- authorize(token) do
      %{current_user: current_user}
    else
      _ -> %{}
    end
  end

  # Note this is a simple token auth strategy. This is should not be used in production.
  defp authorize(token) do
    User
    |> where(token: ^token)
    |> Repo.one()
    |> case do
      nil -> {:error, "invalid authorization token"}
      user -> {:ok, user}
    end
  end
end
