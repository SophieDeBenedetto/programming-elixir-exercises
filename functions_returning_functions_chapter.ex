# fizz_buzz = fn 
# 0, 0, _ -> IO.puts("Fizz")
# _, 0, _ -> IO.puts("Buzz")
# _, _, c -> IO.puts(c)

# end

# fizz_buzz.(0, 0, 1)
# fizz_buzz.(1, 0, 7)
# fizz_buzz.(1, 1, 1)

# remainder = fn num ->
#   fizz_buzz.(rem(num, 3), rem(num, 5), num)
# end

# Enum.map(1..100, remainder)


###########

# prefix = fn str -> 
#   fn second_string -> 
#     "#{str} #{second_string}"
#   end
# end

############

# list = [1, 2, 3, 4, 5]

# IO.inspect Enum.map(list, &(&1 + 2))
# Enum.each(list, &(IO.inspect(&1)))

############

defmodule Times do 
  def double(n) do 
    n * 2
  end
end


























