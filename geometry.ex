defmodule Geometry do
  @forca "ahhhh!"
  def rectangle_area(a, b) do
    a * b
  end

  def square(a) do
    a * a
  end

  # using pipeline operator
  def power_of_four(a) do
    a
    |> square
    |> square
  end

  # manipulating string
  def manipulate_string(str) do
    # Embedded expression defined inside string
    IO.puts "Embedded expression: #{3 + 0.14}"

    # Calling already defined var inside string
    IO.puts "var inside string: #{str}"

    # using Sigils(can be useful if you want to include quotes in a string)
    sigil_one = ~s(This a string like #{str} and can use quotes easily with escaping "for example")
    IO.puts sigil_one

    # Sigil uppercase version ~S that doesn’t handle interpolation or escape characters (\):
    sigil_two = ~S(Not escaped \n)
    IO.puts sigil_two

    # heredocs for better formating with texts containing multiple lines
    here_docs =
    """
    Heredoc must end on its own line ""

    """
    IO.puts here_docs

    # String area actually bytes, you can concatenate using <>
    concat_str = "hahaha vc é " <> "mt loku " <> "véi!"
    IO.puts concat_str

    # using single quotes -> it creates a character list which is
    # essentially a list of integers representing a single characters.
    IO.puts 'ABC'
    # It's the same as creating the list itself:
    IO.puts [65,66,67]

  end

  # using default value for arguments
  def fun(a, b \\ 5, c, d \\ 5) do
    a + b + c + d
  end

  # first class functions -> lambdas
  def first_class_fun(a) do
    square = fn(x) -> x * x end
    square.(a)
  end

  def lambda_test() do
    # first version(using pure lambda)
    Enum.each(
      [1, 2, 3],
      fn(x) -> IO.puts(x) end
    )
    # second version(using capture)
    Enum.each(
      [1,2,3],
      &IO.puts/1
    )

    # first version(using pure lambda)
    lambda = fn(x, y, z) -> x * y + z end
    IO.puts lambda.(1, 2, 3)

    # second version(using capture)
    lambda_cap = &(&1 *&2 + &3)
    IO.puts lambda_cap.(1, 2, 3)

  end

  def closure_example() do
    outside_var = 5
    lambda = fn() -> IO.puts(outside_var) end
    outside_var = 6
    # should still print 5 because it points to the memory location of
    # the var and don't look for any rebind
    lambda.()
  end

  def higher_level_types() do
    # Ranges
    range = 1..2
    IO.puts("2 in range? #{2 in range}")
    IO.puts("-1 in range? #{-1 in range}")

    # Keyword List
    # 1st way
    days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]
    # best way
    days = [monday: 1, tuesday: 2, wednesday: 3]
    IO.puts Keyword.get(days, :monday)

  end

  def hash_dict() do
    days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]
    |> Enum.into(HashDict.new)
    #IO.puts days
  end

  # missing hashSet and iolists from CHAPTER 1(ELIXIR IN ACTION)...


end

