defmodule Comprehensions do

  def square(list) do
    for x <- list do
      x * x
    end
  end

  # returns a multiplication list
  def multiply_lists_list(l1, l2) when length(l1) == length(l2) do
    for x <- l1, y <- l2, do: {x, y, x*y}
  end

  # returns a multiplication map
  def multiply_lists_map(l1, l2) when length(l1) == length(l2) do
    multiplication_table =
      for x <- l1, y <- l2, into: %{} do
        { {x, y}, {x * y} }
      end
    multiplication_table
  end
end