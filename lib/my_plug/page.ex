defmodule MyPlug.Page do
  import Plug.Conn

  def render(conn, controller, action) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "TODO: Query the database for data about #{action}")
  end
  
end