#! /usr/bin/env elixir

defmodule DNA do
  def complement(acid) do
    case acid do
      "A" -> "T"
      "C" -> "G"
      "T" -> "A"
      "G" -> "C"
    end
  end

  def randomizer do
    case :rand.uniform(4) do
      1 -> "A"
      2 -> "C"
      3 -> "T"
      4 -> "G"
    end
  end

  def generate_chain(repetition) do
    Enum.map(1..repetition, fn _ ->
      base = DNA.randomizer()
      IO.write("(#{base} (     ) #{base_complement})\n `-.`. ,',-'\n    _,-'\"\n ,-',' `.`-.\n")
    end)
  end
end

{arguments, _, _} =
  System.argv()
  |> OptionParser.parse(strict: [repeat: :integer])

arguments[:repeat]
|> DNA.generate_chain()
