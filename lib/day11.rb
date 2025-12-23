# frozen_string_literal: true

class Day11
  def part1(input)
    graph = parse(input)
    count_paths(graph, "you", "out")
  end

  def parse(input)
    input.each_line.with_object({}) do |line, graph|
      node, *outputs = line.scan(/[a-z]+/)
      graph[node] = outputs
    end
  end

  def count_paths(graph, start, target, visited = Set.new)
    return 1 if start == target

    graph[start].reduce(0) do |path_count, output|
      next path_count unless visited.add?(output)

      path_count + count_paths(graph, output, target, visited.dup)
    end
  end
end
