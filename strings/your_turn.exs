defmodule MyString do 

  def is_ascii?(sqc) do
    Enum.all?(sqc, &_is_ascii?/1)
  end

  def _is_ascii?(char) do 
    char in ? ..?~
  end

  def anagram?(word1, word2) do 
    Enum.sort(word1) == Enum.sort(word2)
  end

  def do_math(seq) do 
    to_string(seq)
    |> execute_regex()
    |> _do_math()
  end

  def execute_regex(string), do: Regex.split(~r/\s/, string)

  def _do_math([num1, "+", num2]), do: String.to_integer(num1) + String.to_integer(num2)
  def _do_math([num1, "*", num2]), do: String.to_integer(num1) * String.to_integer(num2)
  def _do_math([num1, "-", num2]), do: String.to_integer(num1) - String.to_integer(num2)
  def _do_math([num1, "/", num2]), do: String.to_integer(num1) / String.to_integer(num2)

  def center(list) do 
    sorted_list = Enum.sort_by(list, &String.length/1)
    longest_word = List.last(sorted_list)
    width = String.length(longest_word)
    Enum.each(sorted_list, &offset_string(&1, width))
  end

  def calc_offset(string, width) do 
    div(width - String.length(string), 2)
  end

  def offset_string(string, width) do 
    IO.puts "#{String.duplicate(" ", calc_offset(string, width))}#{string}"
  end
end

# 32 = whitespace
