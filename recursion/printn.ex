defmodule Printn do

  def go(_, 0), do: :ok 

  def go(message, count) do
    IO.puts message
    go(message, count - 1)
  end
end

IO.inspect Printn.go("hello", 3)
