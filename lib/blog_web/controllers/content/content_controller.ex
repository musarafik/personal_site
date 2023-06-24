defmodule BlogWeb.ContentController do
  use BlogWeb, :controller

  alias Blog.Content

  def home(conn, _param) do
    posts = Content.list_posts()
    render(conn, :home, posts: posts)
  end

  def new_post(conn, _params) do
    # changeset = Content.change_post(%Post{})
    render(conn, :new_post)
  end

  def create_post(conn, %{"post" => post_params}) do
    res = Content.create_post(post_params)
    case res do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Post created successfully!")
        |> redirect(to: ~p"/posts")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new_post, changeset: changeset)
    end
  end

  def show_post(conn, %{"id" => id}) do
    post = Content.get_post!(id)
    render(conn, :show_post, post: post)
  end

  def about(conn, _params) do
    render(conn, :about)
  end

  def resume(conn, _params) do
    render(conn, :resume)
  end

  def top_posts(conn, _params) do
    render(conn, :top_posts)
  end
end
