# defmodule Heimdallr.UserManager.Guardian do
#   use Guardian, otp_app: :heimdallr

#   alias Heimdallr.Repo.User

#   def subject_for_token(user, _claims) do
#     {:ok, to_string(user.id)}
#   end

#   def resource_from_claims(%{"sub" => id}) do
#     user = User.find!(id)
#     {:ok, user}
#   rescue
#     Ecto.NoResultsError -> {:error, :resource_not_found}
#   end
# end
