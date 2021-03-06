defmodule MyPlug.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts MyPlug.Router.init([])

  test "returns this entire website runs on Elixir plugs!" do
    conn = conn(:get, "/")
    conn = MyPlug.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "This entire website runs on Elixir plugs!"
  end

  test ":name wildcard routing" do
    conn = conn(:get, "/about/Everyone")
    conn = MyPlug.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Everyone is vital to our website's continued success"
  end

  test ":name wildcard but with a guard clause routing" do
    conn = conn(:get, "/about/history")
    conn = MyPlug.Router.call(conn, @opts)

    assert conn.resp_body == "Our website has a short, yet colorful history"
  end

  test "more flexiable wildcard" do
    conn = conn(:get, "/about/offices/mars")
    conn = MyPlug.Router.call(conn, @opts)
    assert conn.resp_body == "Yes, we do have offices over there by Mars."
  end



end