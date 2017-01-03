defmodule MyEnum do
  def all?([], fun), do: true
  def all?([head | tail], fun) do
    if fun.(head) do
      all?(tail, fun) 
    else
      false
    end
  end

  def each([], _), do: []
  def each([head  | tail], fun) do 
    [fun.(head) | each(tail, fun)]
  end

  def filter([], _), do: []
  def filter([head | tail], fun) do 
    if fun.(head) do 
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  def split(list, position) do 
    {_split(list, position, 0), Enum.reverse _split(Enum.reverse(list), position - 1, 0)}
  end

  defp _split([head | tail], position, count)
  when count < position do
    [head | _split(tail, position, count + 1)]
  end

  defp _split(_, _, _), do: []

  def take(list, num) do
    _take(list, num, 0)
  end

  defp _take([head | tail], num, count) 
  when count < num do
    [head | _take(tail, num, count + 1)]
  end

  defp _take(_, _, _), do: []

  def flatten([]), do: []
  
  def flatten([head | tail])
  when is_list(head) do
    flatten(head)  
  end

  def flatten([head | tail]) do
    [head | flatten(tail)]
  end


end
