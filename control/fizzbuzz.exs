defmodule FizzBuzz do 

  # def upto(n) when n > 0, do: _upto(1, n, [])

  # def _upto(_current, 0, result), do: Enum.reverse result

  # def _upto(current, left, result) do 
  #   next_answer =
  #   cond do
  #     rem(current, 3) == 0 and rem(current, 5) == 0 ->
  #       "FizzBuzz"
  #     rem(current, 3) == 0 ->
  #       "Fizz"
  #     rem(current, 5) == 0 ->
  #       "Buzz"
  #     true ->
  #       current
  #   end
  #   _upto(current+1, left-1, [next_answer | result])
  # end

  def upto(n) do 
    1..n
    |> Enum.map(&fizz_buzz/1)
  end

  def fizz_buzz(n) do 
    case {rem(n, 3), rem(n, 5)} do 
      {0, 0} -> 
        "FizzBuzz"
      {0, _} -> 
        "Fizz"
      {_, 0} -> 
        "Buzz"
      {_, _} -> 
        n
    end
  end

  def ok!(file) do 
    case File.open(file) do 
      {:ok, data} -> 
        data
      {:error, msg} -> 
        raise "Failed: #{msg}"
    end
  end

  # def fizz_buzz(n) do 
  #   case divisible_by(n) do
  #     [3, 5] -> 
  #       "FizzBuzz"
  #     [3] -> 
  #       "Fizz"
  #     [5] -> 
  #       "Buzz"
  #     _ -> 
  #       n
  #   end
  # end

  # def divisible_by(n) when rem(n, 3) == 0 and rem(n, 5) == 0, do: [3, 5]

  # def divisible_by(n) when rem(n, 3) == 0, do: [3] 
  
  # def divisible_by(n) when rem(n, 5) == 0, do: [5]

  # def divisible_by(n), do: n 


  # defp fizz_buzz(n) when rem(n, 3) == 0 and rem(n, 5) == 0, do: "FizzBuzz"
  # defp fizz_buzz(n) when rem(n, 3) == 0, do: "Fizz"
  # defp fizz_buzz(n) when rem(n, 5) == 0, do: "Buzz"
  # defp fizz_buzz(n), do: n

  # def fizz_buzz(n) do 
  #   cond do 
  #     (rem(n, 3) == 0) && (rem(n, 5) == 0) ->
  #       [n, "FizzBuzz"]
  #       # "#[n]: FizzBuzz"
  #     (rem(n, 3) == 0) && (rem(n, 5) != 0) ->
  #       [n, "Fizz"]
  #       # "#[n]: Fizz"
  #     (rem(n, 3) != 0) && (rem(n, 5) == 0) ->
  #       [n, "Buzz"]
  #       # "#[n]: Buzz"
  #     true ->
  #       [n, "nada"]
  #       # "#[n} nada"
  #   end
  # end
end
