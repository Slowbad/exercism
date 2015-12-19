defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    String.split(sentence)
    |> List.foldl(%{}, &do_things/2)
  end

  def do_things(ele, acc) do
    case acc[ele] do
      nil -> Map.put(acc, ele, 1)
      _   -> Map.put(acc, ele, acc[ele] + 1)
    end
  end
end
