defmodule Blog.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Content.Comment

  schema "posts" do
    field :title, :string
    field :body, :string
    has_many(:comments, Comment)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
    |> validate_length(:title, min: 1)
    |> validate_length(:body, min: 1)
  end
end
