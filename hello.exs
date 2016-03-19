# IO.puts("Hello World!")

###

# handle_open = fn
#   {:ok, file} -> "First line: #{IO.read(file, :line)}"
#   {_, error} -> "Error: #{:file.format_error(error)}"
# end

# IO.puts handle_open.(File.open("test.ex"))
# IO.puts handle_open.(File.open("nonexistent"))

### exercise: functions-2

# fizzy = fn
#   (0, 0, _) -> "FizzBuzz"
#   (0, _, _) -> "Fizz"
#   (_, 0, _) -> "Buzz"
#   (_, _, c) -> "#{c}"
# end

# ### exercise: functions-3

# buzzer = fn
#   (n) -> fizzy.(rem(n, 3), rem(n, 5), n) |> IO.puts
# end

# buzzer.(10)
# buzzer.(11)
# buzzer.(12)
# buzzer.(13)
# buzzer.(14)
# buzzer.(15)
# buzzer.(16)
# buzzer.(17)
# buzzer.(18)
# buzzer.(19)
# buzzer.(20)

### exercise: functions-4

# prefix = fn
#   string_1 -> fn
#     string_2 -> "#{string_1} #{string_2}" |> IO.puts
#   end
# end

# mrs = prefix.("Mrs.")
# mrs.("Banana")
# prefix.("Elixir").("is SICK!")

###

# times_2 = fn
#   n -> n * 2
# end

# apply_this = fn
#   (function, value) -> function.(value) |> IO.puts
# end

# apply_this.(times_2, 6)

### the & notation

# add_one = &(&1 + 1)
# square = &(&1 * &1)
# speak = &(IO.puts(&1))


# add_one.(45) |> IO.puts
# square.(8) |> IO.puts
# speak.("DAMN SON YOU JUST GOT HIT BY THE 'WOW' FACTOR")

### exercise: functions-5

add_to_list = Enum.map([1,2,3,4], &(&1 + 2)) |> IO.inspect

add_to_list














