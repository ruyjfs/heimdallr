defmodule SkeletonElixirWeb.Router do
  use SkeletonElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SkeletonElixirWeb do
    pipe_through :api
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug SkeletonElixirWeb.Context
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: SkeletonElixirWeb.Schema
      # interface: :simple

    forward "/", Absinthe.Plug,
      schema: SkeletonElixirWeb.Schema
  end
end

