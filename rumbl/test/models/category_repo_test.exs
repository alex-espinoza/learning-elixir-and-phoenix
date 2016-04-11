defmodule Rumbl.CategoryRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.Category

  test "alphabetical/1 orders by name" do
    insert_category("C")
    insert_category("A")
    insert_category("B")

    query = Category |> Category.alphabetical()
    query = from c in query, select: c.name
    assert Repo.all(query) == ~w(A B C)
  end
end
