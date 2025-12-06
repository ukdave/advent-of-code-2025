# frozen_string_literal: true

class Day3
  def part1(input)
    parse(input).sum { |batteries| max_joltage(batteries) }
  end

  def part2(input)
    parse(input).sum { |batteries| max_joltage2(batteries) }
  end

  def parse(input)
    input.each_line.map { it.chomp.chars.map(&:to_i) }
  end

  def max_joltage(batteries)
    batteries[..-2].each_with_index.map do |value, index|
      (value * 10) + batteries[(index + 1)..].max
    end.max
  end

  def max_joltage2(batteries)
    select_max_batteries(batteries, 0, 12).join.to_i
  end

  def select_max_batteries(batteries, start, remaining)
    return [] if remaining.zero?

    end_index = batteries.length - remaining
    subset = batteries[start..end_index]
    value, idx = subset.each_with_index.max_by { |value, _idx| value }
    [value] + select_max_batteries(batteries, start + idx + 1, remaining - 1)
  end
end
