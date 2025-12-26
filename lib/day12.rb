# frozen_string_literal: true

class Day12
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Performance/Count
  def part1(input)
    puzzle = parse(input)

    present_areas = puzzle[:presents].map do |present|
      present.sum { |row| row.count("#") }
    end

    puzzle[:regions].reject do |region|
      # reject regions that cant possibly fit all presents
      present_area = region[:present_counts].each_with_index.sum do |quantity, present_idx|
        present_areas[present_idx] * quantity
      end
      region_area = region[:size][0] * region[:size][1]
      present_area > region_area
    end.size
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Performance/Count

  # rubocop:disable Metrics/MethodLength
  def parse(input)
    sections = input.split("\n\n")

    presents = sections[0..-2].map do |present_section|
      present_section.lines[1..].map(&:chomp)
    end

    regions = sections[-1].each_line.map do |region_line|
      nums = region_line.scan(/\d+/).map(&:to_i)
      size = nums[0, 2]
      present_counts = nums[2..]
      { size:, present_counts: }
    end

    { presents:, regions: }
  end
  # rubocop:enable Metrics/MethodLength
end
