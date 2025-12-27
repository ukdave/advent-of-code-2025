# frozen_string_literal: true

class Day10
  Machine = Data.define(:target_indicator_state, :buttons, :joltage_requirements) do
    def self.from_line(line)
      parts = line.match(/\[(.+?)\]\s+(.+?)\s+\{(.+?)\}/)
      target_indicator_state = parts[1]
      buttons = parts[2].scan(/\((.*?)\)/).map { |b| b[0].split(",").map(&:to_i) }
      joltage_requirements = parts[3].split(",").map(&:to_i)
      new(target_indicator_state:, buttons:, joltage_requirements:)
    end

    def target_indicator_state_binary
      target_indicator_state.each_char.with_index.reduce(0) do |binary, (char, index)|
        char == "#" ? binary | (1 << index) : binary
      end
    end

    def buttons_binary
      buttons.map do |button|
        button.reduce(0) { |binary, index| binary | (1 << index) }
      end
    end
  end

  def part1(input)
    parse(input).sum { |machine| min_button_presses_for_indicators(machine) }
  end

  def part2(input)
    parse(input).sum { |machine| min_button_presses_for_joltage(machine.joltage_requirements, machine.buttons) }
  end

  def parse(input)
    input.each_line.map { |line| Machine.from_line(line) }
  end

  # Use Breadth-First Search (BFS) to find the minimum button presses required to set the indicators to the target state
  # rubocop:disable Metrics/MethodLength
  def min_button_presses_for_indicators(machine)
    queue = [[0, 0]] # [indicators, presses]
    visited = [0] # array of indicator states we've seen

    until queue.empty?
      indicators, presses = queue.shift
      return presses if indicators == machine.target_indicator_state_binary

      machine.buttons_binary.each do |buttons|
        next_indicators = indicators ^ buttons

        unless visited.include?(next_indicators)
          visited << next_indicators
          queue.push([next_indicators, presses + 1])
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # Recursively compute the minimum number of button presses needed to reduce the given joltages to zero.
  #
  # This is an implementation of the solution described here:
  # https://www.reddit.com/r/adventofcode/comments/1pk87hl/2025_day_10_part_2_bifurcate_your_way_to_victory/
  #
  # The algorithm involves finding all possible sets of buttons that can be pushed to make joltages even,
  # then halving the joltages and recursing.
  #
  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
  def min_button_presses_for_joltage(joltages, buttons, memo = {})
    return memo[joltages] if memo.key?(joltages)
    return 0 if joltages.all?(&:zero?)

    best = Float::INFINITY

    # Try every possible button combination
    button_combinations = (0..buttons.length).flat_map { |subset_size| buttons.combination(subset_size).to_a }
    button_combinations.each do |button_subset|
      remaining_joltages = joltages.dup

      # Apply the button presses in this subset to try and make the joltages even
      button_subset.each do |counter_indices|
        counter_indices.each do |counter_index|
          remaining_joltages[counter_index] -= 1
        end
      end

      # Skip this button subset if it doesn't lead to a valid state
      next if remaining_joltages.any?(&:negative?)
      next unless remaining_joltages.all?(&:even?)

      # Halve the joltages and recurse
      next_joltages = remaining_joltages.map { |j| j / 2 }
      remaining_presses = min_button_presses_for_joltage(next_joltages, buttons, memo)

      # Calculate total button presses:
      # - one press per button that made the joltages even
      # - recursive presses count double due to halving
      total_presses = button_subset.length + (2 * remaining_presses)
      best = [best, total_presses].min
    end

    memo[joltages] = best
    best
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
end
