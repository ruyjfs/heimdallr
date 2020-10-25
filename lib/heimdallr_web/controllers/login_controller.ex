defmodule HeimdallrWeb.LoginController do
  use HeimdallrWeb, :controller
  # use Guardian.Phoenix.Controller

  def create(conn, params) do
    # case find_the_user_and_verify_them_from_params(params) do
    #   {:ok, user} ->
    #     {:ok, jwt, _claims} = Guardian.encode_and_sign(user, :access)
    #     conn |> respond_somehow(%{token: jwt})

    #   {:error, reason} ->
    #     nil
    #     # handle not verifying the user's credentials
    # end
  end

  # def delete(conn, params) do
  def delete(conn) do
    jwt = Guardian.Plug.current_token(conn)
    Guardian.revoke!(jwt)
    # respond_somehow(conn)
  end

  # def some_action(conn, params, user, claims) do
  #   # do stuff
  # end

  # def some_action(conn, params) do
  #   if Guardian.Plug.authenticated?(conn) do
  #     user = Guardian.Plug.current_resource(conn)
  #   else
  #     # No user
  #   end
  # end

  # def create(conn, params) do
  #   case find_the_user_and_verify_them_from_params(params) do
  #     {:ok, user} ->
  #       # Use access tokens.
  #       # Other tokens can be used, like :refresh etc
  #       conn
  #       |> Guardian.Plug.sign_in(user, :access)
  #       |> respond_somehow()

  #     {:error, reason} ->
  #       nil
  #       # handle not verifying the user's credentials
  #   end
  # end

  # def delete(conn, params) do
  #   conn
  #   |> Guardian.Plug.sign_out()
  #   |> respond_somehow()
  # end
end
