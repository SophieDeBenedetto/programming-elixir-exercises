defmodule Chop do 

  def guess(actual, low..high)
    when actual == div(low+high, 2) do
      IO.puts "Is it #{actual}?"
      IO.puts "Yes, it's #{actual}."
  end
 
  def guess(actual, low..high)
    when actual < div(low+high, 2) do
      IO.puts "Is it #{div(low+high, 2)}?"
      guess(actual, low..div(low+high, 2))
  end
 
  def guess(actual, low..high)
    when actual > div(low+high, 2) do
      IO.puts "Is it #{div(low+high, 2)}?"
      guess(actual, div(low+high, 2)..high)
  end
  
  defp you_guessed_it(actual, low..high) do
    actual == div(low+high, 2) 
  end

end