ls = [1, 2, 3, 4]
res = Enum.find(ls, fn x -> x == 5 end)
IO.inspect(res)

