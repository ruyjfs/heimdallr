defmodule HeimdallrWeb.PageController do
  use HeimdallrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
