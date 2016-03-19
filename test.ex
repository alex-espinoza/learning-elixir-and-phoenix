# defmodule Example do
#   @greeting "Hello"

#   def greeting(name) do
#     ~s(#{@greeting}, #{name}.)
#   end
# end

# IO.inspect(Example.greeting("Alex"))

###

# defmodule Example.User do
#   defstruct name: "Alex",  roles: []
# end

###

# defmodule Sayings.Greetings do
#   def basic(name), do: IO.inspect("Hi, #{name}.")
# end

# defmodule Example do
#   alias Sayings.Greetings

#   def greeting(name), do: Greetings.basic(name)
# end

# defmodule Example2 do
#   def greeting(name), do: Sayings.Greetings.basic(name)
# end

# defmodule Example3 do
#   alias Sayings.Greetings, as: Hi

#   def print_message(name), do: Hi.basic(name)
# end

# defmodule Example4 do
#   alias Sayings.{Greetings, Farewells}
# end

###

#https://medium.com/@cameronp/functional-programming-is-not-weird-you-just-need-some-new-patterns-7a9bf9dc2f77#.hw7ocw1il






































