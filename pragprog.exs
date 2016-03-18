### chapter 6 - modules and named functions

# defmodule Times do
#   # def double(n) do
#   #   n * 2
#   # end

#   def double(n), do: n * 2

#   def greet(greeting, name), do: (
#     greeting |> IO.puts
#     "How're you doing, #{name}?" |> IO.puts
#   )
# end

### exercise: modules and functions-1, 2, 3

# defmodule Times do
#   def double(n), do: n * 2
#   def triple(n), do: n * 3
#   def quadruple(n), do: double(double(n))
# end

###

# defmodule Factorial do
#   def of(0), do: 1
#   def of(n), do: n * of(n-1)
# end

### exercise: modules and functions-4

# defmodule Add do
#   def sum(0), do: 0
#   def sum(n), do: n + sum(n-1)
# end

### exercise: modules and functions-5

# defmodule Maths do
#   def gcd(x, 0), do: x
#   def gcd(0, y), do: y
#   def gcd(x, y), do: gcd(y, rem(x, y))
# end

# defmodule Guard do
#   def what_is(x) when is_number(x) do
#     "#{x} is a number" |> IO.puts
#   end

#   def what_is(x) when is_list(x) do
#     "#{inspect(x)} is a list" |> IO.puts
#   end

#   def what_is(x) when is_atom(x) do
#     "#{x} is an atom" |> IO.puts
#   end
# end

# defmodule Factorial do
#   def of(0), do: 1
#   def of(n) when n > 0 do
#     n * of(n - 1)
#   end
# end

# defmodule Example do
#   def func(p1, p2 \\ 2, p3 \\ 3, p4) do
#     [p1, p2, p3, p4] |> IO.inspect
#   end
# end

# defmodule Params do
#   def func(p1, p2 \\ 123)

#   def func(p1, p2) when is_list(p1) do
#     "You said #{p2} with a list." |> IO.puts
#   end

#   def func(p1, p2) do
#     "You passed in #{p1} and #{p2}." |> IO.puts
#   end
# end

### exercise: modules and functions-6

# defmodule Numb do
#   def guess(actual, range = low..high) do
#     guess = div(low+high, 2)
#     "Is it #{guess}?" |> IO.puts
#     _guess(actual, guess, range)
#   end

#   defp _guess(actual, actual, _) do
#     "Yes, it is #{actual}" |> IO.puts
#   end

#   defp _guess(actual, guess, _low..high) when guess < actual do
#     guess(actual, guess+1..high)
#   end

#   defp _guess(actual, guess, low.._high) when guess > actual do
#     guess(actual, low..guess-1)
#   end
# end

###

# defmodule Example do
#   @attr "one"
#   def first, do: @attr

#   @attr "two"
#   def second, do: @attr
# end

### exercise: modules and functions-7

# :io_lib.format("The number is ~.2f", [2.543]) |> IO.puts
# System.get_env("USER") |> IO.puts
# Path.extname("learning-elixir/test.iex") |> IO.puts
# System.cwd |> IO.puts
# System.cmd("echo", ["sick pants bro"]) |> IO.inspect

### lists and recursion

# defmodule MyList do
#   def len([]), do: 0
#   def len([_head|tail]), do: 1 + len(tail)

#   def square([]), do: []
#   def square([head|tail]), do: [head * head | square(tail)]

#   def add_one([]), do: []
#   def add_one([head|tail]), do: [head + 1 | add_one(tail)]

#   def map([], _function), do: []
#   def map([head|tail], function), do: [function.(head) | map(tail, function)]
# end

# MyList.map(["a", "b", "c"], fn (ch) -> String.upcase(ch) end) |> IO.inspect
# MyList.map([1, 5, 9], &(&1 + &1)) |> IO.inspect

###

# defmodule MyList do
#   # screw having to remember an extra 0
#   def sum(list), do: _sum(list, 0)
  
#   defp _sum([], total), do: total
#   defp _sum([head|tail], total), do: _sum(tail, head + total)
# end

# MyList.sum([1,2,3,4,5]) |> IO.puts

### exercise: lists and recursion-0

# defmodule MyList do
#   def sum([]), do: 0
#   def sum([head|tail]), do: head + sum(tail)
# end

###

# defmodule MyList do
#   def reduce([], value, _) do
#     value
#   end

#   def reduce([head|tail], value, function) do
#     reduce(tail, function.(head, value), function)
#   end
# end

### exercise: lists and recursion-1

# defmodule MyList do
#   def mapsum([], _function) do
#     0
#   end

#   def mapsum([head|tail], function) do
#     function.(head) + mapsum(tail, function)
#   end

#### exercise: lists and recursion-2

#   def max(list), do: _max(list, List.first(list))
#   #max([1,5,3], 1)
#   #max([5,3], 1)
#   #max([3], 5)
#   #max([], 5)

#   def _max([], value) do
#     value
#   end

#   def _max([head|tail], value) when head >= value do
#     _max(tail, head)
#   end

#   def _max([head|tail], value) when value >= head do
#     _max(tail, value)
#   end
# end

# defmodule MaxList do
#   def max([x]), do: x

#   def max([head|tail]) do
#     Kernel.max(head, max(tail))
#   end
# end

### exercise: lists and recursion-3

# defmodule Cap do
#   def caesar([], _n), do: []
  
#   def caesar([head|tail], n) when head + n <= ?z do
#     [head + n | caesar(tail, n)]
#   end

#   def caesar([head|tail], n) do
#     [head + n - 26 | caesar(tail, n)]
#   end
# end

# Cap.caesar('ryvkve', 13) |> IO.puts

###

# defmodule Swapper do
#   def swap([]), do: []
#   def swap([a, b | tail]), do: [b, a | swap(tail)]
#   def swap([a | tail]), do: [a | swap(tail)]
#   def swap([_]), do: raise "Can't swap a list with an odd number of elements"
# end

###

# defmodule WeatherHistory do
#   def test_data do
#     [
#       [1366225622, 26, 15, 0.125],
#       [1366225622, 27, 15, 0.45],
#       [1366225622, 28, 21, 0.25],
#       [1366229222, 26, 19, 0.081],
#       [1366229222, 27, 17, 0.468],
#       [1366229222, 28, 15, 0.60],
#       [1366232822, 26, 22, 0.095],
#       [1366232822, 27, 21, 0.05],
#       [1366232822, 28, 24, 0.03],
#       [1366236422, 26, 17, 0.025]
#     ]  
#   end

#   def for_location(list, target_location \\ nil)

#   def for_location([], _target_location), do: []
#   def for_location([ head = [_, target_location, _, _] | tail], target_location) do
#     [ head | for_location(tail, target_location)]
#   end 
#   def for_location([_|tail], target_location), do: for_location(tail, target_location)
# end

### exercise: list and recursion-4

# defmodule MyList do
#   #def span(from, to), do: Enum.to_list(from..to)

#   def span(from, to) when from > to, do: []

#   def span(from, to) do
#     [from | span(from + 1, to)]
#   end
# end

### chapter 8 - dictionaries: maps, hashdicts, keywords, sets, and structs

# defmodule Sum do
#   def values(dict) do
#     dict |> Dict.values |> Enum.sum
#   end
# end

###

# people = [
#   %{ name: "Grumpy", height: 1.24 },
#   %{ name: "Dave", height: 1.88 },
#   %{ name: "Dopey", height: 1.32 },
#   %{ name: "Shaquille", height: 2.16 },
#   %{ name: "Sneezy", height: 1.28 }
# ]

# for person = %{ height: height } <- people, height > 1.5, do:
#   IO.inspect(person)

# defmodule HotelRoom do
#   def book(%{name: name, height: height})
#   when height > 1.9 do
#     IO.puts("Need extra long bed for #{name}")    
#   end

#   def book(%{name: name, height: height})
#   when height < 1.3 do
#     IO.puts("Need low shower controls for #{name}")    
#   end

#   def book(person) do
#     IO.puts("Need a regular bed for #{person.name}")    
#   end
# end

# people |> Enum.each(&HotelRoom.book/1)

###

# m = %{a: 1, b: 2, c: 3}
# m1 = %{m | b: "two", c: "three"}
# m2 = %{m1 | a: "one"}

###

# defmodule Subscriber do
#   defstruct name: "", paid: false, over_18: true
# end

# s1 = %Subscriber{}
# s2 = %Subscriber{ name: "Dave" }
# s3 = %Subscriber{ name: "Mary", paid: true }
# s3.name
# %Subscriber{name: a_name} = s3
# a_name
# s4 = %Subscriber{ s3 | name: "Marie", paid: true, over_18: false }

###

# defmodule Attendee do
#   @derive Access
#   defstruct name: "", paid: false, over_18: true

#   def may_attend_after_party(attendee = %Attendee{}) do
#     attendee.paid && attendee.over_18
#   end

#   def print_vip_badge(%Attendee{name: name}) when name != "" do
#     IO.puts("Very cheap badge for #{name}")
#   end

#   def print_vip_badge(%Attendee{}) do
#     raise "Missing name for badge"
#   end
# end

###

# defmodule Customer do
#   defstruct name: "", company: ""
# end

# defmodule BugReport do
#   defstruct owner: %{}, details: "", severity: 1
# end

###

# defmodule DataStuff do
#   def nested do
#     %{
#       buttercup: %{
#         actor: %{
#           first: "Robin",
#           last: "Wright"
#         },
#         role: "princess"
#       },
#       westley: %{
#         actor: %{
#           first: "Carey",
#           last: "Ewes"
#         },
#         role: "farm boy"
#       }
#     }
#   end 
# end

###

# defmodule Authors do
#   def data do
#     [
#       %{name: "Jose", language: "Elixir"},
#       %{name: "Matz", language: "Ruby"},
#       %{name: "Larry", language: "Perl"}
#     ]
#   end
# end

# languages_with_an_r = fn (:get, collection, next_function) ->
#   for row <- collection do
#     if String.contains?(row.language, "r") do
#       next_function.(row)
#     end
#   end
# end

###

# set1 = Enum.into(1..5, HashSet.new)
# Set.member?(set1, 3)
# set2 = Enum.into(3..8, HashSet.new)
# Set.union(set1, set2)
# Set.difference(set1, set2)
# Set.difference(set2, set1)
# Set.intersection(set1, set2)

### chapter 10 - processing collections - enum and stream

# list = Enum.to_list(1..5)
# # [1,2,3,4,5]

# Enum.concat([1,2,3], [4,5,6])
# # [1,2,3,4,5,6]
# Enum.concat([1,2,3], 'abc')
# # [1,2,3,97,98,99]

# Enum.map(list, &(&1 * 10))
# # [10,20,30,40,50]
# Enum.map(list, &String.duplicate("*", &1))
# # ["*", "**", "***", "****", "*****"]

# Enum.at(10..20, 3)
# # 3
# Enum.at(10..20, 20)
# # nil
# Enum.at(10..20, 20, :no_one_here)
# # :no_one_here
# Enum.filter(list, &(&1 > 2))
# # [3,4,5]
# Enum.filter(list, &Integer.is_even/1)
# # [2,4]
# Enum.reject(list, &Integer.is_even(&1))
# # [1,3,5]

# Enum.sort ["there", "was", "a", "crooked", "man"]
# # ["a", "crooked", "man", "there", "was"]
# Enum.sort ["there", "was", "a", "crooked", "man"], &(String.length(&1) <= String.length(&2))
# # ["a", "man", "was", "there", "crooked"]
# Enum.max ["there", "was", "a", "crooked", "man"]
# # "was"
# Enum.max_by ["there", "was", "a", "crooked", "man"], &String.length/1
# # "crooked"

# Enum.take(list, 3)
# # [1, 2, 3]
# Enum.take_every list, 2
# # [1, 3, 5]
# Enum.take_while(list, &(&1 < 4))
# # [1, 2, 3]
# Enum.split(list, 3)
# # {[1, 2, 3], [4, 5]}
# Enum.split_while(list, &(&1 < 4))
# # {[1, 2, 3], [4, 5]}

# Enum.join(list)
# # "12345"
# Enum.join(list, ", ")
# # "1, 2, 3, 4, 5"

# Enum.all?(list, &(&1 < 4))
# # false
# Enum.any?(list, &(&1 < 4))
# # true
# Enum.member?(list, 4)
# # true
# Enum.empty?(list)
# # false

# Enum.zip(list, [:a, :b, :c])
# # [{1, :a}, {2, :b}, {3, :c}]
# Enum.with_index(["once", "upon", "a", "time"])
# # [{"once", 0}, {"upon", 1}, {"a", 2}, {"time", 3}]

# Enum.reduce(1..100, &(&1+&2))
# # 5050
# Enum.reduce(["now", "is", "the", "time"], fn (word, longest) ->
#   if String.length(word) > String.length(longest) do
#     word
#   else
#     longest
#   end
# end)
# # "time"
# Enum.reduce(["now", "is", "the", "time"], 0, fn (word, longest) ->
#   if String.length(word) > longest do
#     String.length(word)
#   else
#     longest
#   end
# end)
# # 4

# import Enum
# deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]
# # ['C2', 'D2', 'H2', 'S2', 'C3', 'D3', ... ]
# deck |> shuffle |> take(13)
# # ['DQ', 'S6', 'HJ', 'H4', 'C7', 'D6', 'SJ', 'S9', 'D7', 'HA', 'S4', 'C2', 'CT']
# hands = deck |> shuffle |> chunk(13)
# # [['D8', 'CQ', 'H2', 'H3', 'HK', 'H9', 'DK', 'S9', 'CT', 'ST', 'SK', 'D2', 'HA'],
# # ['C5', 'S3', 'CK', 'HQ', 'D3', 'D4', 'CA', 'C8', 'S6', 'DQ', 'H5', 'S2', 'C4'],
# # ['C7', 'C6', 'C2', 'D6', 'D7', 'SA', 'SQ', 'H8', 'DT', 'C3', 'H7', 'DA', 'HT'],
# # ['S5', 'S4', 'C9', 'S8', 'D5', 'H4', 'S7', 'SJ', 'HJ', 'D9', 'DJ', 'CJ', 'H6']]

### exercise: list and recursion-1

# require IEx

# defmodule Elu do
#   def all?(list), do: all?(list, fn x -> !!x end) #converts truthy value to true
#   def all?([], _function), do: true
#   def all?([head|tail], function) do
#     if function.(head) do
#       all?(tail, function)
#     else
#       false
#     end
#   end

#   def each([], _function), do: []
#   def each([head|tail], function), do: [function.(head) | each(tail, function)]

#   def filter([], _function), do: []
#   def filter([head|tail], function) do
#     if function.(head) do
#       [head | filter(tail, function)]
#     else
#       filter(tail, function)
#     end
#   end

#   def split(list, count) do 
#     #IEx.pry
#     _split(list, [], count)
#   end
#   defp _split([], front, _) do 
#     #IEx.pry
#     [ Enum.reverse(front), [] ]
#   end
#   defp _split(tail, front, 0) do 
#     #IEx.pry
#     [ Enum.reverse(front), tail ]
#   end
#   defp _split([ head | tail ], front, count)  do
#     #IEx.pry
#     _split(tail, [head|front], count-1)
#   end

#   # def take([], _integer), do: []
#   # def take(list, 0), do: list
#   # def take([list1 = [0..integer] | tail], integer) do
#   #   list1
#   # end
# end

###

# Stream.cycle(~w{green white}) |>
# Stream.zip(1..5) |>
# Enum.map(fn {class, value} ->
#   ~s{<tr class="#{class}"><td>#{value}</td></tr>\n} end) |>
# IO.puts

# defmodule Countdown do
#   def sleep(seconds) do
#     receive do
#       after seconds * 1000 -> nil
#     end
#   end

#   def say(text) do
#     spawn fn -> :os.cmd('say #{text}') end
#   end

#   def timer do
#     Stream.resource(
#       fn ->
#         {_h, _m, s} = :erlang.time
#         60 - s - 1
#       end,

#       fn
#         0 ->
#           {:halt, 0}

#         count ->
#           sleep(1)
#           {[inspect(count)], count - 1}
#       end,

#       fn _ -> end
#     )
#   end
# end

###

# for x <- [1, 2, 3, 4, 5], do: x * x
# # [1, 4, 9, 16, 25]

# for x <- [1, 2, 3, 4, 5], x < 4, do: x * x
# # [1, 4, 9]

# for x <- [1, 2], y <- [5, 6], do: x * y
# # [5, 6, 10, 12]

# for x <- [1,2], y <- [5,6], do: {x, y}
# # [{1, 5}, {1, 6}, {2, 5}, {2, 6}]

# min_maxes = [{1,4}, {2,3}, {10, 15}]
# for {min,max} <- min_maxes, n <- min..max, do: n
# # [1, 2, 3, 4, 2, 3, 10, 11, 12, 13, 14, 15]

# first8 = [ 1,2,3,4,5,6,7,8 ]
# for x <- first8, y <- first8, x >= y, rem(x*y, 10)==0, do: { x, y }
# # [{5, 2}, {5, 4}, {6, 5}, {8, 5}]

# reports = [ dallas: :hot, minneapolis: :cold, dc: :muggy, la: :smoggy ]
# for { city, weather } <- reports, do: { weather, city }
# # [hot: :dallas, cold: :minneapolis, muggy: :dc, smoggy: :la]

# for x <- ~w{ cat dog }, into: %{}, do: { x, String.upcase(x) }
# # %{"cat" => "CAT", "dog" => "DOG"}

# for x <- ~w{ cat dog }, into: Map.new, do: { x, String.upcase(x) }
# # %{"cat" => "CAT", "dog" => "DOG"}

# for x <- ~w{ cat dog }, into: %{"ant" => "ANT"}, do: { x, String.upcase(x) }
# # %{"ant" => "ANT", "cat" => "CAT", "dog" => "DOG"}

### exercise: list and recursion-7

# defmodule MyList do
#   #def span(from, to), do: Enum.to_list(from..to)

#   def span(from, to) when from > to, do: []

#   def span(from, to) do
#     [from | span(from + 1, to)]
#   end

#   def primes(n) do
#     for num <- span(2, n), is_prime?(num), do: num
#   end

#   defp is_prime?(2), do: true
#   defp is_prime?(num) do
#     Enum.all?(span(2, num-1), &(rem(num, &1) != 0))
#   end
# end

### exercise: list and recursion-8

# defmodule Comprend do
#   def orders do
#     [
#       [ id: 123, ship_to: :NC, net_amount: 100.00 ],
#       [ id: 124, ship_to: :OK, net_amount: 35.50 ],
#       [ id: 125, ship_to: :TX, net_amount: 24.00 ],
#       [ id: 126, ship_to: :TX, net_amount: 44.80 ],
#       [ id: 127, ship_to: :NC, net_amount: 25.00 ],
#       [ id: 128, ship_to: :MA, net_amount: 10.00 ],
#       [ id: 129, ship_to: :CA, net_amount: 102.00 ],
#       [ id: 120, ship_to: :NC, net_amount: 50.00 ] 
#     ]
#   end

#   def tax_rates do
#     [ NC: 0.075, TX: 0.08]
#   end

#   def orders_with_total(orders, tax_rates) do
#     orders |> Enum.map(&add_total_to(&1, tax_rates))
#   end

#   defp add_total_to(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
#     tax_rate = Keyword.get(tax_rates, state, 0)
#     tax = net * tax_rate
#     total = net + tax
#     Keyword.put(order, :total_amount, total)
#   end
# end

### chapter 11 - strings and binaries
### exercise: strings-and-binaries-1

# defmodule MyString do
#   def all_good(character) do
#     Enum.all?(character, fn ch -> ch in ?\s..?~ end) 
#   end
# end

### exercise: strings-and-binaries-6

# defmodule MyString do
#   def capitalize_sentences(string) do
#     string |> String.split(". ") |> Enum.map(&String.capitalize(&1)) |> Enum.join(". ")
#   end
# end

### exercise: strings-and-binaries-7

## reads from orders.csv

# require IEx

# defmodule SimpleCSV do
#   def read(filename) do
#     file = File.open!(filename)
#     headers = read_headers(IO.read(file, :line))
#     Enum.map(IO.stream(file, :line), &create_one_row(headers, &1))
#   end

#   defp read_headers(header_line) do
#     from_csv_and_map(header_line, &String.to_atom(&1))
#   end

#   defp create_one_row(headers, row_csv) do
#     row = from_csv_and_map(row_csv, &maybe_convert_numbers(&1))
#     Enum.zip(headers, row)
#   end

#   defp from_csv_and_map(row_csv, mapper) do
#     row_csv
#     |> String.strip
#     |> String.split(",")
#     |> Enum.map(mapper)
#   end

#   defp maybe_convert_numbers(value) do
#     cond do
#       Regex.match?(~r{^\d+$}, value) -> 
#         {integer, _} = Integer.parse(value)
#         integer
#       Regex.match?(~r{^\d+\.\d+$}, value) -> 
#         {float, _} = Float.parse(value)
#         float
#       << ":", atom::binary >> = value -> 
#         String.replace(value, ":", "")
#         |> String.to_atom
#       true -> value
#     end
#   end
# end

# defmodule Tax do
#   def orders_with_total(orders, tax_rates) do
#     Enum.map(orders, &add_total_to(&1, tax_rates))
#   end

#   def add_total_to(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
#     tax_rate = Keyword.get(tax_rates, state, 0)
#     tax = net * tax_rate
#     total = net + tax
#     Keyword.put(order, :total_amount, total)
#   end
# end

# tax_rates =  [ NC: 0.075, TX: 0.08 ]

### chapter 12 - control flow

# defmodule FizzBuzz do
#   def upto(n) when n > 0, do: _upto(1, n, [])

#   defp _upto(_current, 0, result), do: Enum.reverse(result)

#   defp _upto(current, left, result) do
#     next_answer = 
#       cond do
#         rem(current, 3) == 0 and rem(current, 5) == 0 ->
#           "FizzBuzz"
#         rem(current, 3) == 0 ->
#           "Fizz"
#         rem(current, 5) == 0 ->
#           "Buzz"
#         true ->
#           current
#       end
#     _upto(current + 1, left - 1, [next_answer | result])
#   end
# end

# defmodule FizzBuzz2 do
#   def upto(n) when n > 0 do
#     1..n |> Enum.map(&fizzbuzz/1)
#   end

#   defp fizzbuzz(n) when rem(n, 3) == 0 and rem(n, 5) == 0, do: "FizzBuzz"
#   defp fizzbuzz(n) when rem(n, 3) == 0, do: "Fizz"
#   defp fizzbuzz(n) when rem(n, 5) == 0, do: "Buzz"
#   defp fizzbuzz(n), do: n
# end

###

# case File.open("orders.csv") do
#   {:ok, file} ->
#     IO.puts("First line: #{IO.read(file, :line)}")
#   {:error, reason} ->
#     IO.puts("Failed to open file: #{reason}")
# end

# defmodule Users do
#   alex = %{name: "Alex", state: "MA", likes: "programming", age: 25}

#   case alex do
#     %{state: some_state} = person ->
#       IO.puts("#{person.name} lives in #{some_state}")

#     _ ->
#       IO.puts("No matches")
#   end

#   case alex do
#     person = %{age: age} when is_number(age) and age >= 21 ->
#       IO.puts("You are cleared to enter the Foo Bar, #{person.name}")
#   end
# end

### exercise: control-flow-1

# defmodule FizzBuzz do
#   def up_to(n) when n > 0 do
#     1..n |> Enum.map(&count(&1))
#   end

#   def count(n) do
#     case {rem(n, 3), rem(n, 5), n} do
#       {0, 0, _} -> "FizzBuzz"
#       {0, _, _} -> "Fizz"
#       {_, 0, _} -> "Buzz"
#       {_, _, n} -> n
#     end
#   end
# end

### exercise: control-flow-3

defmodule Mine do
  def ok!(type) do
    case type do
      {:ok, data} ->
        data
      {:error, data} ->
        raise "That shit wasn't no tuple. This what I got back: #{data}"
    end
  end
end






  































