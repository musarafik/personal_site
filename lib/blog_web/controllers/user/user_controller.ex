defmodule BlogWeb.UserController do
  use BlogWeb, :controller
  alias BlogWeb.User

  def signup(conn, %{"username" => username, "password" => password}) do
    User.signup_user(username, password)
    render(conn, :signup)
  end

  def login(conn, %{"username" => username, "password" => password}) do
    User.login_user(username, password)
    render(conn, :login)
  end

  def new_user(conn, _params) do
    render(conn, :new_user)
  end

  def show_login(conn, _params) do
    render(conn, :show_login)
  end
end
