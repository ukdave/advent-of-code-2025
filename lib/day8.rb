# frozen_string_literal: true

class Day8
  JunctionBox = Data.define(:x, :y, :z)

  def part1(input, connection_limit)
    junction_boxes = parse(input)
    circuits = connect_shortest(distances(junction_boxes).take(connection_limit))
    circuits.map(&:length).sort.last(3).reduce(1, :*)
  end

  def part2(input)
    junction_boxes = parse(input)
    pair = connect_all(junction_boxes)
    pair.first.x * pair.last.x
  end

  def parse(input)
    input.each_line.map do |line|
      JunctionBox.new(*line.split(",").map(&:to_i))
    end
  end

  def connect_shortest(junction_box_distances)
    junction_box_distances.each_with_object([]) do |((jb1, jb2), _dist), circuits|
      connect(jb1, jb2, circuits)
    end
  end

  def connect_all(junction_boxes)
    distances(junction_boxes).each_with_object({ circuits: [], last_pair: [] }) do |((jb1, jb2), _dist), result|
      connect(jb1, jb2, result[:circuits])
      result[:last_pair] = [jb1, jb2]
      break result if result[:circuits].length == 1 && result[:circuits].first.length == junction_boxes.length
    end[:last_pair]
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def connect(jb1, jb2, circuits)
    circuit_a = circuits.find { it.include?(jb1) }
    circuit_b = circuits.find { it.include?(jb2) }
    return if circuit_a && circuit_b && circuit_a == circuit_b

    return circuit_a.concat(circuits.delete(circuit_b)) if circuit_a && circuit_b
    return circuit_a << jb2 if circuit_a
    return circuit_b << jb1 if circuit_b

    circuits << [jb1, jb2]
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def distances(junction_boxes)
    junction_boxes.combination(2)
                  .to_h { |jb1, jb2| [[jb1, jb2], euclidian_distance(jb1, jb2)] }
                  .sort_by { |_k, v| v }
  end

  def euclidian_distance(junction_box1, junction_box2)
    Math.sqrt(((junction_box1.x - junction_box2.x)**2) +
              ((junction_box1.y - junction_box2.y)**2) +
              ((junction_box1.z - junction_box2.z)**2))
  end
end
