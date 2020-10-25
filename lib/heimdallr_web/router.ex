defmodule HeimdallrWeb.Router do
  use HeimdallrWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug(HeimdallrWeb.Context)
  end

  pipeline :maybe_browser_auth do
    plug(Guardian.Plug.VerifySession)
    plug(Guardian.Plug.VerifyHeader, realm: "Bearer")
    plug(Guardian.Plug.LoadResource)
  end

  pipeline :ensure_authed_access do
    plug(Guardian.Plug.EnsureAuthenticated, %{
      "typ" => "access",
      handler: HeimdallrWeb.HttpErrorHandler
    })
  end

  scope "/", HeimdallrWeb do
    pipe_through [:browser]

    get "/", PageController, :index

    # get("/login", LoginController, :new)
    # post("/login", LoginController, :create)
    # delete("/login", LoginController, :delete)
  end

  scope "/api" do
    pipe_through [:api]

    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: HeimdallrWeb.Graphql.Schema)
    #   # interface: :simple

    forward "/", Absinthe.Plug, schema: HeimdallrWeb.Graphql.Schema
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: HeimdallrWeb.Telemetry
    end
  end
end
