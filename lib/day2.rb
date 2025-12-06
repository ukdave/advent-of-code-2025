# frozen_string_literal: true

class Day2
  def part1(input)
    parse(input).sum { |range| invalid_ids(range).sum }
  end

  def part2(input)
    parse(input).sum { |range| invalid_ids2(range).sum }
  end

  def parse(input)
    input.scan(/(\d+)-(\d+)/).map { |(first, last)| (first.to_i..last.to_i) }
  end

  def invalid_ids(range)
    range.select { invalid_num?(it) }
  end

  def invalid_num?(num)
    str_num = num.to_s
    mid = str_num.length / 2
    [str_num[0...mid], str_num[mid..]].uniq.length == 1
  end

  def invalid_ids2(range)
    range.select { invalid_num2?(it) }
  end

  def invalid_num2?(num)
    str_num = num.to_s
    (1..(str_num.length / 2)).any? do |split_point|
      part = str_num[0, split_point]
      str_num =~ /^(#{part}){2,}$/
    end
  end
end
