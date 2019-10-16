defmodule BracketsTest do
  use ExUnit.Case

  test "empty" do
    assert Brackets.valid?("")
  end

  test "start with close" do
    refute Brackets.valid?("}")
  end

  test "opens but never closes" do
    refute Brackets.valid?("(")
  end

  test "opens and closes" do
    assert Brackets.valid?("()")
  end

  test "final_test" do
    assert Brackets.valid?("(){}[]") == true
    assert Brackets.valid?("([{}])") == true
    assert Brackets.valid?("(}") == false
    assert Brackets.valid?("[(])") == false
    assert Brackets.valid?("[({})](]") == false
  end
end
