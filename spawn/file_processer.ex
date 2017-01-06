defmodule FibSolver do 
  def fib(scheduler) do 
    send scheduler, {:ready, self}
    receive do 
      {:fib, n, client} ->
        send client, {:answer, n, fib_calc(n), self}
        fib(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)
end

defmodule CatLover do 
  def cat_count(scheduler) do 
    send scheduler, {:ready, self}
    receive do 
      {:cat_count, filename, client} ->
        send client, {:answer, filename, count_cats(filename), self}
        cat_count(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  def count_cats(filename) do 
    File.read!(filename)
    |> String.split
    |> Enum.reduce(0, &update_cat_count(&1, &2))  
  end

  def update_cat_count("cat", acc) do 
    acc + 1
  end

  def update_cat_count(_, _), do: 0
end

defmodule Scheduler do 
  def run(num_processes, module, func, to_calculate) do 
    (1..num_processes)
    |> Enum.map(fn(_) -> spawn(module, func, [self]) end)
    |> schedule_processes(to_calculate, [], func)
  end

  def schedule_processes(processes, queue, results, func) do
    receive do 
      {:ready, pid} when length(queue) > 0 ->
        [next | tail ] = queue
        send pid, {func, next, self}
        schedule_processes(processes, tail, results, func)
      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do 
          schedule_processes(List.delete(processes, pid), queue, results, func)
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1<= n2 end)
        end
      {:answer, processed_item, result, _pid} -> 
        schedule_processes(processes, queue, [{processed_item, result} | results], func)
    end
  end
end



to_process = File.ls!("./cats") |> Enum.map(&("./cats" <> "/" <> &1))

Enum.each 1..10, fn num_processes ->
  {time, result} = :timer.tc(
    # Scheduler, :run, [num_processes, FibSolver, :fib, to_process]
    Scheduler, :run, [num_processes, CatLover, :cat_count, to_process]
  )

  if num_processes == 1 do 
    IO.puts inspect result
    IO.puts "\n # time (s)"
  end
  :io.format "~2B       ~.2f~n", [num_processes, time/1000000.0]
end


to_process = [37, 37, 37, 37, 37, 37]

Enum.each 1..10, fn num_processes ->
  {time, result} = :timer.tc(
    Scheduler, :run, [num_processes, FibSolver, :fib, to_process]
  )

  if num_processes == 1 do 
    IO.puts inspect result
    IO.puts "\n # time (s)"
  end
  :io.format "~2B       ~.2f~n", [num_processes, time/1000000.0]
end













