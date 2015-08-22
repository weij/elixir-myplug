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
 
  get "about/:name" when name == "history" do
    send_resp(conn, 200, "Our website has a short, yet colorful history")
  end
 
  get "about/:name" do
    send_resp(conn, 200, "#{name} is vital to our website's continued success")
  end
  
  get "about/*glob" do
    [hello, world] = glob
    send_resp(conn, 200, "#{hello} to my #{world}")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end