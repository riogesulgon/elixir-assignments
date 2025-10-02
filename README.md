# Notes for Pragmatic Studio course for Elixir


# 🟠 Create mix project
## installation
### ubuntu
sudo add-apt-repository ppa:rabbitmq/rabbitmq-erlang
sudo apt update
sudo apt install git elixir erlang

## compiling
iex -S mix
iex lib/servy.ex

c "lib/servy.ex"
## recompile in iex
r Servy

## history config
add in `.zshrc` or `.bashrc`
```shell
export ERL_AFLAGS="-kernel shell_history enabled"
```

## related documentation
mix - https://hexdocs.pm/elixir/introduction-to-mix.html
modules and functions - https://hexdocs.pm/elixir/modules-and-functions.html
iex - https://hexdocs.pm/iex/IEx.html 
# 🟠 High Level Transformations
## pipeline of functions
```elixir
request
|> parse
|> route
|> format_response
```
*using the pipe operator*
## nested function calls
traditional style:
```elixir
def handle(request) do
  conv = parse(request)
  conv = route(conv)
  format_response(conv)
end
```

## related documentation
pipe operator - https://hexdocs.pm/elixir/Kernel.html#%7C%3E/2

# 🟠 Pattern matching
using atoms as keys
```
%{ :method => "GET", :path => "/wildthings" }
```

shorthand
```
%{ method: "GET", path: "/wildthings" }
```

string as keys
```elixir
%{ "method" => "GET", "path" => "/wildthings" }
```

operator for string
```
=>
```

## related documentation
pattern matching - https://hexdocs.pm/elixir/pattern-matching.html

# 🟠 Immutable Data

```elixir
iex> conv = %{ method: "GET", path: "/wildthings" }
```

square bracket syntax:
```elixir
iex> conv[:method]
"GET"

iex> conv[:path]
"/wildthings"
```

dot notation:
```elixir
iex> conv.method
"GET"

iex> conv.path
"/wildthings"
```
*this only works for atoms*

using `byte_size` to get exact bytes. used for utf-8 characters that have double bytes for each character.
```elixir
Content-Length: #{byte_size(conv.resp_body)}
```

## Related documentation

Map - https://hexdocs.pm/elixir/Map.html


# 🟠 Function clauses
```elixir
def route(%{method: "GET", path: "/wildthings"} = conv) do
  %{ conv | resp_body: "Bears, Lions, Tigers" }
end

def route(%{method: "GET", path: "/bears"} = conv) do
  %{ conv | resp_body: "Teddy, Smokey, Paddington" }
end
```

[[elixir function clauses]]

## inline functions
  ```elixir
  def log(conv), do: IO.inspect conv
  ```
  
# 🟠 Advanced pattern matching  

  ```elixir
  def route(conv, "GET", "/bears/" <> id) do
    %{ conv | status: 200, resp_body: "Bear #{id}" }
  end
  ```

### map shorthand
- look up code directly without creating a named variable
- Keys are numbers so arrow operator is needed
```elixir
defp status_reason(code) do
  %{
    200 => "OK",
    201 => "Created",
    401 => "Unauthorized",
    403 => "Forbidden",
    404 => "Not Found",
    500 => "Internal Server Error"
  }[code]
end
```

### Related documentation
https://hexdocs.pm/elixir/pattern-matching.html


# 🟠 Serving files
## 🟣 Documentation
Tuple module documentation - https://hexdocs.pm/elixir/Tuple.html
case documentation - https://hexdocs.pm/elixir/case-cond-and-if.html#case
Path.join/2 documentation - https://hexdocs.pm/elixir/Path.html#join/2
Path.expand/2 documentation - https://hexdocs.pm/elixir/Path.html#expand/2
File.read/1 documentation - https://hexdocs.pm/elixir/File.html#read/1

# 🟠 Module attributes

## 🟣 iex not compiled with docs
### ⚫ solution 1: save compiled unit to cwd
```elixir
c "servy/lib/handler.ex" "."
```

### ⚫ solution 2: start iex with compiled mix
```elixir
iex -S mix
```

# 🟠 Organizing files
- Kernel - https://hexdocs.pm/elixir/Kernel.html
- import - https://hexdocs.pm/elixir/alias-require-and-import.html#import

# 🟠 Structs
## 💠 Additional Documentation 
structs - https://hexdocs.pm/elixir/structs.html
alias - https://hexdocs.pm/elixir/alias-require-and-import.html#alias

# 🟠 heads and tails
## 💠 Additional Documentation 
pattern matching - https://hexdocs.pm/elixir/pattern-matching.html
decode_query - https://hexdocs.pm/elixir/URI.html#decode_query/3

# 🟠 Recursion
## 💠 Additional Documentation 
recursion - https://hexdocs.pm/elixir/recursion.html

# 🟠 enums
enum cheatsheet - https://hexdocs.pm/elixir/main/enum-cheat.html
## 🔶 Capturing expressions
### 💠 functions
```elixir
Enum.map(phrases, &String.upcase(&1))
```
*String.upcase/1*

&String.upcase(&1)

### 💠 long form
```elixir
Enum.map(phrases, fn(x) -> String.upcase(x) end)
```
*Long form*

fn(x) -> String.upcase(x) end
### 💠 expressions
```
Enum.map([1, 2, 3], &(&1 * 3))
```

### 💠 shorthand
```
&(&1 *x)
```
### 💠 calling a function
```elixir
&String.duplicate/2 
```

&String.duplicate/2).("hello", 2)

