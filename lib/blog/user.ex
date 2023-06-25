defmodule Blog.User do
  import Ecto.Query, warn: false
  alias Blog.Repo
  alias Blog.User.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> change_user(attrs)
    |> Repo.insert()
    |> case do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def update_user(%User{} = user, attrs) do
    user
    |> change_user(attrs)
    |> Repo.update()
  end

  def change_user(%User{} = user, attrs \\ %{}) do
    user
    |> Repo.preload(:comments)
    |> User.changeset(attrs)
  end

  def login_user(username, password) do
    username
    password
  end

  def signup_user(username, password) do
    username
    password
  end
end
