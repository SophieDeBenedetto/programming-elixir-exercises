defmodule MyList do 
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add_one([]), do: []
  def add_one([head | tail]), do: [head + 1 | add_one(tail)]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [func.(head) | map(tail, func)]

  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def reduce([], value, _), do: value
  def reduce([head | tail], value, func) do 
    reduce(tail, func.(head, value), func)
  end

  def mapsum([], _), do: 0
  def mapsum([head | tail], func) do 
    map([head | tail], func)
    |> sum
  end

  def max([]), do: 0
  def max([head | tail]) do
    _max(head, tail) 
  end

  defp _max(prev_max, [head | tail]) when head > prev_max do 
    _max(head, tail)
  end

  defp _max(prev_max, [head | tail]) do 
    _max(prev_max, tail)
  end

  defp _max(prev_max, []) do 
    prev_max
  end

  def span(from, to) when from == to do 
    [to]
  end

  def span(from, to) do 
    [from | span(from + 1, to)]
  end

  def prime_up_to(n) do 
    range = span(2, n)
    for x <- range, prime?(x) do
      x
    end
  end

  def prime?(2), do: true

  def prime?(num) do 
    span(2, num - 1) 
    |> Enum.filter(fn a -> rem(num, a)==0 end)
    |> length() == 0
  end

  def orders_with_tax(tax_rates, orders) do 
    Enum.map(orders, add_tax(order, tax_rates))
  end


end











