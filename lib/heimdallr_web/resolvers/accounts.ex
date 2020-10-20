defmodule HeimdallrWeb.Resolvers.Accounts do
  def list_users(_parent, _args, _resolution) do
    {:ok, Heimdallr.Accounts.list_users()}
  end

  def find_user(_parent, %{id: id}, _resolution) do
    case Heimdallr.Accounts.find_user(id) do
      nil ->
        {:error, "User ID #{id} not found"}

      user ->
        {:ok, user}
    end
  end

  def create_user(_parent, args, %{context: %{current_user: %{admin: true}}}) do
    Heimdallr.Accounts.create_user(args)
  end

  def create_user(_parent, _args, _resolution) do
    {:error, "Access danied"}
  end
end
