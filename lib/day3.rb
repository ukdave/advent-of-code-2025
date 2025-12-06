# frozen_string_literal: true

class Day3
  def part1(input)
    parse(input).sum { |batteries| max_joltage(batteries) }
  end

  def parse(input)
    input.each_line.map { it.chomp.chars.map(&:to_i) }
  end

  def max_joltage(batteries)
    batteries[..-2].each_with_index.map do |value, index|
      (value * 10) + batteries[(index + 1)..].max
    end.max
  end
end
