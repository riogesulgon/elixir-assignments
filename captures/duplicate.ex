a = "hello"
b = 4

dupe = fn(a, b) -> String.duplicate(a, b) end

"method 1" |> IO.puts()

dupe.(a, b)
|> IO.puts()

"method 2" |> IO.puts()

dupe2 = &String.duplicate/2 
dupe2.(a, b)
|> IO.puts()
