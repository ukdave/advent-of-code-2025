# frozen_string_literal: true

class Day1
  def part1(input)
    parse(input).reduce({ position: 50, zero_count: 0 }) do |status, (direction, distance)|
      turn(status[:position], status[:zero_count], direction, distance)
    end[:zero_count]
  end

  def part2(input)
    parse(input).reduce({ position: 50, zero_count: 0 }) do |status, (direction, distance)|
      turn2(status[:position], status[:zero_count], direction, distance)
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

  # rubocop:disable Metrics/MethodLength
  def turn2(position, zero_count, direction, distance)
    old_position = position
    distance *= -1 if direction == "L"
    new_position = position + distance

    zero_count += if new_position.positive?
                    new_position / 100
                  elsif new_position.zero?
                    1
                  elsif old_position.zero?
                    new_position.abs / 100
                  else
                    (new_position.abs / 100) + 1
                  end

    new_position %= 100
    { position: new_position, zero_count: }
  end
  # rubocop:enable Metrics/MethodLength
end
