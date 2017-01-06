defmodule SpawnBasic do 
  def greet do 
    receive do 
      {sender, msg} -> 
        send sender, {:ok, "Hello, #{msg}"}
    end
  end
end

defmodule Parallel do
  def pmap(collection, fun) do 
    me = self
    collection
    |> Enum.map(fn(elem) ->
      spawn_link fn -> (send me, {self, fun.(elem)})end
    end)
    |> Enum.map(fn (pid) ->
      receive do {^pid, result} -> result end
    end)
  end 
end