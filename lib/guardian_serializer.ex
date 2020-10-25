# defmodule Heimdallr.GuardianSerializer do
#   @behaviour Guardian.Serializer

#   # alias Heimdallr.Repo
#   # alias Heimdallr.Schema.User

#   # def for_token(user = %User{}), do: {:ok, "User:#{user.id}"}
#   # def for_token(_), do: {:error, "Unknown resource type"}

#   # def from_token("User:" <> id), do: {:ok, Repo.get(User, id)}
#   # def from_token(_), do: {:error, "Unknown resource type"}

#   use Guardian, otp_app: :heimdallr

#   # def subject_for_token(resource, _claims) do
#   #   {:ok, to_string(resource.id)}
#   # end

#   # def subject_for_token(_, _) do
#   #   {:error, :reason_for_error}
#   # end

#   # def resource_from_claims(claims) do
#   #   {:ok, find_me_a_resource(claims["sub"])}
#   # end

#   def resource_from_claims(_claims) do
#     {:error, :reason_for_error}
#   end
# end
