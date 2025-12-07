# frozen_string_literal: true

class Day6
  def part1(input)
    parse(input).sum { |problem| solve(problem) }
  end

  def parse(input)
    lines = input.lines
    column_indexes(lines).each_cons(2).with_object([]) do |(start_idx, end_idx), problems|
      problems << lines.map { |line| line[start_idx...end_idx].strip }
                       .map { it.match?(/^\d+$/) ? it.to_i : it }
    end
  end

  def column_indexes(lines)
    lines.first.each_char.with_index.with_object([0]) do |(char, index), column_indexes|
      column_indexes << index if char == " " && lines.all? { |line| line[index] == " " }
    end << -1
  end

  def solve(problem)
    numbers = problem[0..-2]
    operator = problem[-1]

    case operator
    when "+" then numbers.sum
    when "*" then numbers.reduce(1, :*)
    else raise "Unknown operator: #{operator}"
    end
  end
end
