# frozen_string_literal: true

class Day2
  def part1(input)
    parse(input).sum { |range| invalid_ids(range).sum }
  end

  def parse(input)
    input.scan(/(\d+)-(\d+)/).map { |(first, last)| (first.to_i..last.to_i) }
  end

  def invalid_ids(range)
    range.select { invalid_num?(it) }
  end

  def invalid_num?(num)
    halves = split_string(num.to_s)
    halves.first == halves.last
  end

  def split_string(str)
    mid = str.length / 2
    [str[0...mid], str[mid..]]
  end
end
