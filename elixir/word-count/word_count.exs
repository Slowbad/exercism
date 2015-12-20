defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> split_words
    |> count_words
  end

  defp count_word_occurances([word], word_counts) do
    Dict.update(word_counts, word, 1, &(&1 + 1))
  end

  defp split_words(sentence) do
    Regex.scan(~r/(*UTF)[\p{L}\d-]+/, sentence)
  end

  defp count_words(word_list) do
    Enum.reduce(word_list, %{}, &count_word_occurances/2)
  end

end
