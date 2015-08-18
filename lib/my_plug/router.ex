defmodule MyPlug.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  # root path
  get "/" do
    send_resp(conn, 200, "This entire website runs on Elixir plugs!")
  end
end