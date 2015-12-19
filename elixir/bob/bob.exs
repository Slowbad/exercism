defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      String.ends_with?(input, "?") -> "Sure."
      input == String.upcase(input) and String.match?(input, ~r/\p{L}/) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp silence?(input) do
    String.strip(input) == ""
  end
end
