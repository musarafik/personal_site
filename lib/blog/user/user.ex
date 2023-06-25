defmodule Blog.User.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Content.Post

  schema "users" do
    field :username, :string
    field :password, :string
    field :role, Ecto.Enum, values: [:user, :admin], default: :user
    has_many(:comments, Comment)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required(:username, :password)
    |> validate_length(:username, min: 1)
    |> validate_length(:password, min: 1)
  end
end
