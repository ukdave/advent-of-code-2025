# frozen_string_literal: true

class Day5
  Input = Data.define(:ranges, :ids)

  def part1(input)
    parsed_input = parse(input)
    parsed_input.ids.count { |id| parsed_input.ranges.any? { |range| range.include?(id) } }
  end

  def parse(input)
    ranges, ids = input.split("\n\n")
    Input.new(
      ranges: ranges.scan(/(\d+)-(\d+)/).map { |first, last| (first.to_i..last.to_i) },
      ids: ids.scan(/\d+/).map(&:to_i)
    )
  end
end
