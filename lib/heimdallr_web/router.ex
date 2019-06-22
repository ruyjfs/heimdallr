defmodule HeimdallrWeb.Router do
  use HeimdallrWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", HeimdallrWeb do
    pipe_through(:api)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(HeimdallrWeb.Context)
  end

  scope "/api" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: HeimdallrWeb.Schema)
    # interface: :simple

    forward("/", Absinthe.Plug, schema: HeimdallrWeb.Schema)
  end
end
