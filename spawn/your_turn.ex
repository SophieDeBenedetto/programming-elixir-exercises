defmodule MySpawn do

  def say_hello do 
    receive do 
      {pid, token} -> 
        send pid, token
    end
  end 

  def create_processes(token1, token2) do 
    process1 = spawn(MySpawn, :say_hello, [])
    process2 = spawn(MySpawn, :say_hello, [])
    # [process1, process2] = [spawn(MySpawn, :say_hello, []), spawn(MySpawn, :say_hello, [])]
    send process1, {self, token1}
    send process2, {self, token2}
    receive do 
      ^token2 -> IO.puts "Got reply: #{token2}"
    end

    receive do 
      ^token1 -> IO.puts "Got reply: #{token1}"
    end
  end

  def run(token1, token2) do 
    IO.puts inspect MySpawn.create_processes(token1, token2)
  end
end



# ef counter(next_pid) do 
#     receive do 
#       n -> send next_pid , n + 1
#     end
#   end

#   def create_processes(n) do 
#     last = Enum.reduce 1..n, self,
#       fn(_, send_to) -> spawn(Chain, :counter, [send_to]) end
#     # now last is the last Chain.counter + recieiving PID process
#     # IEx.pry
#     send last, 0
#     receive do 
#       final_answer when is_integer(final_answer) -> 
#         "Result is #{inspect(final_answer)}"
#     end
#   end

#   def run(n) do 
#     IO.puts inspect :timer.tc(Chain, :create_processes, [n])
#   end