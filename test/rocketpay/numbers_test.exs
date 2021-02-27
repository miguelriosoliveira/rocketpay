defmodule Rocketpay.NumbersTest do
  use ExUnit.Case, async: true

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with the given name, return the sum of numbers" do
      sum_of_numbers = Numbers.sum_from_file("numbers")

      expected = {:ok, %{result: 37}}

      assert sum_of_numbers == expected
    end

    test "when there is no file with the given name, returns an error" do
      sum_of_numbers = Numbers.sum_from_file("banana")

      expected = {:error, %{message: "Invalid file!"}}

      assert sum_of_numbers == expected
    end
  end
end
