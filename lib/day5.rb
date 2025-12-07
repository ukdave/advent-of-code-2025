# frozen_string_literal: true

class Day5
  Input = Data.define(:ranges, :ids)

  def part1(input)
    parsed_input = parse(input)
    parsed_input.ids.count { |id| parsed_input.ranges.any? { |range| range.include?(id) } }
  end

  def part2(input)
    merge_ranges(parse(input).ranges).sum(&:size)
  end

  def parse(input)
    ranges, ids = input.split("\n\n")
    Input.new(
      ranges: ranges.scan(/(\d+)-(\d+)/).map { |first, last| (first.to_i..last.to_i) },
      ids: ids.scan(/\d+/).map(&:to_i)
    )
  end

  # rubocop:disable Metrics/MethodLength
  def merge_ranges(ranges)
    ranges.sort_by(&:begin).each_with_object([]) do |range, acc|
      if acc.empty?
        acc << range
      else
        last = acc[-1]
        if last.end >= range.begin - 1
          acc[-1] = (last.begin..[last.end, range.end].max)
        else
          acc << range
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
end
