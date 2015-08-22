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
    [thing, place] = glob
    send_resp(conn, 200, "Yes, we do have #{thing} over there by #{String.capitalize(place)}.")
  end

  get "about/demo/*glob" do
    send_resp(conn, 200, "Woah there! Our website does not know what to do with this: #{inspect glob}")
  end

  get "/json/:name" do
    conn 
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{name: name}))
  end

  get "/page/:action" do
    [controller, action] = ["page", action]
    MyPlug.Page.render(conn, controller, action)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end