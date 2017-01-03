defmodule Swapper do 
  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise "must be even numbered list"
end

defmodule WeatherHistory do 
  def for_loc([], _target_lco), do: []
  def for_loc([ head = [_, target_loc, _, _] | tail], target_loc) do
    [head | for_loc(tail, target_loc)]
  end
  def for_loc([ _ | tail], target_loc), do: for_loc(tail, target_loc)
end