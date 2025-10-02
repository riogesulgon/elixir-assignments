defmodule Triple do

  def go([], current) do
    current |> Enum.reverse
  end

  def go([head | tail], current) do
    go(tail, [head * 3 | current])
  end
end

IO.inspect Triple.go([1, 2, 3, 4, 5], [])
