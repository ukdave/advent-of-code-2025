# frozen_string_literal: true

class Day9
  Point = Data.define(:x, :y)

  Polygon = Data.define(:points) do
    def edges
      points.each_cons(2).to_a << [points.last, points.first]
    end

    def bounding_box
      xs = points.map(&:x)
      ys = points.map(&:y)
      { min_x: xs.min, max_x: xs.max, min_y: ys.min, max_y: ys.max }
    end
  end

  def part1(input)
    parse(input).combination(2).map { |points| area(*points) }.max
  end

  def part2(input)
    polygon = Polygon.new(points: parse(input))
    polygon.points.combination(2)
           .select { |points| rectangle_in_polygon?(build_rectangle(*points), polygon) }
           .map { |points| area(*points) }
           .max
  end

  def parse(input)
    input.each_line.map do |line|
      Point.new(*line.split(",").map(&:to_i))
    end
  end

  # Calculates the area of a rectangle defined by two diagonal Points
  def area(point1, point2)
    ((point2.x - point1.x).abs + 1) * ((point2.y - point1.y).abs + 1)
  end

  # Builds a rectangular Polygon given two diagonal Points
  def build_rectangle(point1, point2)
    x_min, x_max = [point1.x, point2.x].minmax
    y_min, y_max = [point1.y, point2.y].minmax
    Polygon.new(points: [Point.new(x: x_min, y: y_min), Point.new(x: x_max, y: y_min),
                         Point.new(x: x_max, y: y_max), Point.new(x: x_min, y: y_max)])
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
  def rectangle_in_polygon?(rectangle, polygon)
    # We know that the rectangle is formed from polygon vertices, so we only need to check if any edge of
    # the polygon intersects the rectangle. An edge intersects if it passes through the bounds of the rectangle.
    bb = rectangle.bounding_box

    polygon.edges.any? do |(a, b)|
      # Edge passes through rectangle if:
      # - Both endpoints are outside the rectangle, and the edge crosses it, OR
      # - The edge lies partially inside the rectangle bounds

      # Horizontal edge
      if a.y == b.y
        y = a.y
        x_min, x_max = [a.x, b.x].minmax
        # Horizontal edge intersects rectangle if y is inside and x-range overlaps
        y > bb[:min_y] && y < bb[:max_y] && x_min < bb[:max_x] && x_max > bb[:min_x]
      # Vertical edge
      elsif a.x == b.x
        x = a.x
        y_min, y_max = [a.y, b.y].minmax
        # Vertical edge intersects rectangle if x is inside and y-range overlaps
        x > bb[:min_x] && x < bb[:max_x] && y_min < bb[:max_y] && y_max > bb[:min_y]
      else
        false
      end
    end == false
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
end
