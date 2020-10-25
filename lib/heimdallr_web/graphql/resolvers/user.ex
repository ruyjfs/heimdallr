defmodule HeimdallrWeb.Resolvers.User do
  alias Heimdallr.Repo.User

  def list(_parent, _args, _resolution), do: {:ok, User.list()}

  @spec find(any, %{id: any}, any) :: {:error, <<_::64, _::_*8>>} | {:ok, any}
  def find(_parent, %{id: id}, _resolution) do
    case User.find(id) do
      nil ->
        {:error, "User ID #{id} not found"}

      user ->
        {:ok, user}
    end
  end

  def create(_parent, args, %{context: %{current_user: %{admin: true}}}) do
    User.create_user(args)
  end

  def create(_parent, _args, _resolution) do
    {:error, "Access danied"}
  end
end
