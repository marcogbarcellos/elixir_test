defmodule HigherOrderFunctions do
  #higher-order function is a function that takes function(s) as its
  # input and/or returns function(s)

  # Enum.filter returns a list(enumerable actually) with the elements that return true from the lambda
  def enum_filter(list) do
    # Enum.filter(
    #   [1, 2, 3],
    #   fn(x) -> rem(x, 2) == 1 end
    # )
    Enum.filter(
      list,
      &(rem(&1,2) == 1)
    )
  end

  # Enum.reduce is able to get a list and transform it in anything,
  # in this case a sum of all elements
  def enum_reduce_sum(list) do
    # Enum.reduce(
    #   [1, 2, 3],
    #   0,
    #   fn(element, sum) -> sum + element end
    # )
    Enum.reduce(list, 0, &+/2)
  end

  # in this case a multiplication of all elements
  def enum_reduce_multiply(list) do
    # Enum.reduce(
    #   [1, 2, 3],
    #   0,
    #   fn(element, sum) -> sum * element end
    # )
    Enum.reduce(list, 0, &*/2)
  end

  # Handling a list that contains Non-number elements to sum only the numbers in the list
  def enum_reduce_only_numbers() do
    Enum.reduce(
      [1, :test, "Not a number",2],
      0,
      fn
        element, sum when is_number(element) ->
          sum + element

        _, sum -> sum
      end
    )
  end

  # Calling the lambda from another defined function
  def sum_nums(enumerable) do
    Enum.reduce(enumerable, 0, &add_num/2)
  end

  defp add_num(element, sum) when is_number(element), do: sum + element
  defp add_num(_, sum), do: sum
end