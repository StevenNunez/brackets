defmodule Brackets do
  @opening_brackets ["[", "{", "("]
  @closing_brackets ["]", "}", ")"]

  def valid?(""), do: true
  def valid?(brackets) when is_binary(brackets) do
    brackets
    |> String.split(~r//, trim: true)
    |> valid?
  end

  def valid?([h | t]), do: do_valid?(h, t, [])
  def do_valid?(_current, [], []), do: false
  def do_valid?(current, [next | remaining], open_brackets) when current in @opening_brackets do
    do_valid?(next, remaining, [current | open_brackets])
  end
  def do_valid?(current, [next | remaining], [current_open_bracket | remaining_open_brackets])
      when current in @closing_brackets do
    if get_closing_char(current_open_bracket) == current do
      do_valid?(next, remaining, remaining_open_brackets)
    else
      false
    end
  end
  def do_valid?(current, [], [current_open_bracket | []]) when current in @closing_brackets do
    get_closing_char(current_open_bracket) == current
  end
  defp get_closing_char("("), do: ")"
  defp get_closing_char("{"), do: "}"
  defp get_closing_char("["), do: "]"
end
