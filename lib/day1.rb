# frozen_string_literal: true

class Day1
  def part1(input)
    parse(input).reduce({ position: 50, zero_count: 0 }) do |status, (direction, distance)|
      turn(status[:position], status[:zero_count], direction, distance)
    end[:zero_count]
  end

  private

  def parse(input)
    input.scan(/([LR])(\d+)/)
         .map { |direction, distance| [direction, distance.to_i] }
  end

  def turn(position, zero_count, direction, distance)
    distance *= -1 if direction == "L"
    position = (position + distance) % 100
    zero_count += 1 if position.zero?
    { position:, zero_count: }
  end
end
