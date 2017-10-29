defmodule Streaming do
# Streams perform lazy operations.
# Their methods are quite similar to the Enum ones, except they are lazy

  # in this case, Enum.with_index is going to iterate through the list
  # and then Enum.each is going to iterate again
  # list [9, -1, "foo", 25, 49]
  def print_ordered_list_not_efficiently(list) do
    list
    |> Enum.filter(&(is_number(&1) and &1 > 0))
    |> Enum.map(&{&1, :math.sqrt(&1)})
    |> Enum.with_index
    |> Enum.each(
      fn({{input, result}, index}) ->
      IO.puts "#{index + 1}. sqrt(#{input}) = #{result}"
      end
    )
  end

  # in this case, Stream.with_index is not going to iterate over the list
  # because it has a lazy approach, it needs go through an Enum function as it's only
  # executed on demand
  # list [9, -1, "foo", 25, 49]
  def print_ordered_list_efficiently(list) do
    list
    |> Stream.filter(&(is_number(&1) and &1 > 0))
    |> Stream.map(&{&1, :math.sqrt(&1)})
    |> Stream.with_index
    |> Enum.each(
      fn({{input, result}, index}) ->
      IO.puts "#{index + 1}. sqrt(#{input}) = #{result}"
      end
    )
  end

  # Through the benchmark we see that for a few pipelines with a few items on the array
  # Enum stills performs better whereas Streams might be more useful in cases
  # with several pipelines(20+) and a huge amount of data in the arrays(1M+)
  def benchmark(list) do
    {time_enum, _} = :timer.tc(fn -> print_ordered_list_not_efficiently(list) end)
    {time_stream, _} = :timer.tc(fn -> print_ordered_list_efficiently(list) end)
    IO.puts "time using only enum is #{time_enum} milliseconds and time using stream is #{time_stream} milliseconds "
  end

end