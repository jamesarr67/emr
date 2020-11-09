defmodule EmrWeb.PageController do
  use EmrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
