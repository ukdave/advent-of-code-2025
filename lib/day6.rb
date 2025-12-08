# frozen_string_literal: true

class Day6
  def part1(input)
    parse(input).sum { |problem| solve(problem) }
  end

  def part2(input)
    parse2(input).sum { |problem| solve(problem) }
  end

  def parse(input)
    lines = input.lines
    column_indexes(lines).each_cons(2).with_object([]) do |(start_idx, end_idx), problems|
      problems << lines.map { |line| line[start_idx...end_idx].strip }
                       .map { it.match?(/^\d+$/) ? it.to_i : it }
    end
  end

  def parse2(input)
    lines = input.lines
    column_indexes(lines).each_cons(2).with_object([]) do |(start_idx, end_idx), problems|
      problem_lines = lines.map { |line| line[start_idx...end_idx] }
      problems << parse_problem2(problem_lines)
    end
  end

  def parse_problem2(problem_lines)
    numbers = problem_lines[0..-2].map(&:chars).transpose.reverse.map(&:join).reject { it.strip.empty? }.map(&:to_i)
    operator = problem_lines.last.strip
    numbers << operator
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
