defmodule MyPlug.Router do
  use Plug.Router

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug :match
  plug :dispatch

  # root path
  get "/" do
    send_resp(conn, 200, "This entire website runs on Elixir plugs!")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end