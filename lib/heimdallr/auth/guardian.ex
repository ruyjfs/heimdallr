defmodule Heimdallr.Auth.Guardian do
  use Guardian, otp_app: :auth_me

  alias Heimdallr.Auth.User

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(%{"sub" => id}) do
    user = User.get_user!(id)
    {:ok, user}
  rescue
    Ecto.NoResultsError -> {:error, :resource_not_found}
  end
end
