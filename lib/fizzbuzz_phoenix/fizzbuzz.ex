defmodule FizzBuzz do

  #the simple fizzbuzz implementation

  def fizzbuzz(n) when rem(n, 15) == 0, do: "FizzBuzz"
  def fizzbuzz(n) when rem(n, 5) == 0, do: "Buzz"
  def fizzbuzz(n) when rem(n, 3) == 0, do: "Fizz"
  def fizzbuzz(n), do: Integer.to_string(n)
end