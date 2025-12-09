# frozen_string_literal: true

class Day7
  def part1(input)
    lines = input.lines.map(&:chomp)
    lines.each.with_index.reduce(0) do |split_count, (line, row)|
      next split_count if row.zero?

      split_count + update_line(line, lines[row - 1])
    end
  end

  private

  # rubocop:disable Metrics/MethodLength
  def update_line(line, previous_line)
    line.each_char.with_index.reduce(0) do |split_count, (char, col)|
      previous_char = previous_line[col]
      if char == "." && ["S", "|"].include?(previous_char)
        line[col] = "|"
      elsif char == "^" && previous_char == "|"
        line[col - 1] = "|"
        line[col + 1] = "|"
        split_count += 1
      end
      split_count
    end
  end
  # rubocop:enable Metrics/MethodLength
end
