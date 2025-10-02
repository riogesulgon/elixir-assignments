defmodule Recurse do
  def go([]), do: IO.puts("done")

  def go([_head | tail]) do
    IO.inspect(tail)
    go(tail)
  end
end

Recurse.go([1, 2, 3, 4, 5])
