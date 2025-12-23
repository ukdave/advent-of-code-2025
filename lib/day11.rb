# frozen_string_literal: true

class Day11
  def part1(input)
    graph = parse(input)
    count_paths(graph, "you", "out")
  end

  def part2(input)
    graph = parse(input)
    count_paths_chain(graph, %w[svr dac fft out]) + count_paths_chain(graph, %w[svr fft dac out])
  end

  def parse(input)
    input.each_line.with_object({}) do |line, graph|
      node, *outputs = line.scan(/[a-z]+/)
      graph[node] = outputs
    end
  end

  def count_paths_chain(graph, nodes)
    nodes.each_cons(2).reduce(1) do |acc, (from, to)|
      path_count = count_paths(graph, from, to)
      break 0 if path_count.zero?

      acc * path_count
    end
  end

  def count_paths(graph, start, target, memo = {})
    return 1 if start == target

    return memo[start] if memo.key?(start)

    outputs = graph[start]
    return 0 unless outputs

    path_count = outputs.reduce(0) do |path_count, output|
      path_count + count_paths(graph, output, target, memo)
    end

    memo[start] = path_count
    path_count
  end
end
