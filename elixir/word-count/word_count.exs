defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    Regex.scan(~r/(\p{L}+(-\p{L}+)?|\d+)/, sentence)
    |> List.foldl(%{}, &count_word_occurances/2)
  end

  def count_word_occurances(word_match, word_counts) do
    [word | _] = word_match
    case word_counts[word] do
      nil -> Map.put(word_counts, word, 1)
      _   -> Map.put(word_counts, word, word_counts[word] + 1)
    end
  end
end
