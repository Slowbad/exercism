defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    Regex.scan(~r/(\p{L}+(-\p{L}+)?|\d+)/, sentence)
    |> extract_scan_matches
    |> List.foldl(%{}, &count_word_occurances/2)
  end

  defp count_word_occurances(word, word_counts) do
    case word_counts[word] do
      nil -> Map.put(word_counts, word, 1)
      _   -> Map.put(word_counts, word, word_counts[word] + 1)
    end
  end

  @doc """
  Extract a list of regex matches from Regex.scan, ignoring capture groups.
  """
  defp extract_scan_matches(scan_list), do: extract_scan_matches(scan_list, [])
  defp extract_scan_matches([], matches), do: matches
  defp extract_scan_matches([head | tail], matches) do
    [match | _] = head
    extract_scan_matches(tail, [match | matches])
  end

end
