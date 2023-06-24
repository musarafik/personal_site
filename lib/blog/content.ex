defmodule Blog.Content do
  import Ecto.Query, warn: false
  alias Blog.Repo
  alias Blog.Content.Post

  def list_posts() do
    Repo.all(Post)
  end

  def create_post(attrs \\ %{}) do
    %Post{}
    |> change_post(attrs)
    |> Repo.insert()
    |> case do
      {:ok, post} -> {:ok, post}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> change_post(attrs)
    |> Repo.update()
  end

  def change_post(%Post{} = post, attrs \\ %{}) do
    post
    |> Repo.preload(:comments)
    |> Post.changeset(attrs)
  end
end
