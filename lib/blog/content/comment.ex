defmodule Blog.Content.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Content.Post

  schema "comments" do
    field :name, :string
    field :content, :string
    belongs_to(:post, Post)

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :content])
    |> validate_required([:name, :content])
    |> validate_length(:name, min: 1)
    |> validate_length(:body, min: 1)
  end
end
