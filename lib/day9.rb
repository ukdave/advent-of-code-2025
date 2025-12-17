# frozen_string_literal: true

class Day9
  Point = Data.define(:x, :y)

  def part1(input)
    parse(input).combination(2).map { |points| area(*points) }.max
  end

  def parse(input)
    input.each_line.map do |line|
      Point.new(*line.split(",").map(&:to_i))
    end
  end

  def area(point1, point2)
    ((point2.x - point1.x).abs + 1) * ((point2.y - point1.y).abs + 1)
  end
end
