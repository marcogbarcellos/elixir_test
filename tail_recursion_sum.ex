defmodule TailRecursionSum do

  def sum(list) do
    do_sum(0,list)
  end

  defp do_sum(total, []) do
    total
  end

  defp do_sum(total, [head | tail]) do
    total + head
    |> do_sum(tail)
    # Or we could do like this:
    # do_sum(total+head, tail)
  end

  def count(list) do
    do_count(0,list)
  end

  defp do_count(list_length,[]) do
    list_length
  end

  defp do_count(list_length,[head | tail]) do
    list_length + head
    |> do_count(tail)
  end

  def range(from, to) do
    make_range(from, to, [])
  end

  defp make_range(from, to, list) when from > to do
    list
  end

  defp make_range(from, to, list) do
    make_range(from, to - 1, [to | list])
  end

  def positive(list) do
    get_positive(list,[])
  end

  defp get_positive([], positives) do
    Enum.reverse(positives)
  end

  defp get_positive([head | tail], positives) when head > 0 do
    get_positive(tail, [ head | positives ])
  end

  defp get_positive([_ | tail], positives) do
    get_positive(tail, positives)
  end

end