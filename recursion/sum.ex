defmodule Triple do

  def go(list), do: go(list, [])
  
  def go([], acc), do: IO.puts("#{acc}")

  def go([head | tail], acc) do
    IO.inspect("head: #{head}, tail: #{inspect(tail)}, acc: #{acc}")
    [head | go(tail,a 
  end
end

Triple.go([1, 2, 3, 4, 5])
