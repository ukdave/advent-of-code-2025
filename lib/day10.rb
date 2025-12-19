# frozen_string_literal: true

class Day10
  Machine = Data.define(:target_state, :buttons) do
    def self.from_line(line)
      parts = line.match(/\[(.+?)\]\s+(.+?)\s+\{(.+?)\}/)
      target_state = indicators_to_binary(parts[1])
      buttons = parts[2].scan(/\((.*?)\)/).map do |b|
        buttons_to_binary(b[0].split(",").map(&:to_i))
      end
      new(target_state:, buttons:)
    end

    def self.indicators_to_binary(indicators_str)
      indicators_str.each_char.with_index.reduce(0) do |binary, (char, index)|
        char == "#" ? binary | (1 << index) : binary
      end
    end

    def self.buttons_to_binary(buttons)
      buttons.reduce(0) { |binary, index| binary | (1 << index) }
    end
  end

  def part1(input)
    parse(input).sum { |machine| min_button_presses(machine) }
  end

  def parse(input)
    input.each_line.map { |line| Machine.from_line(line) }
  end

  # Use Breadth-First Search (BFS) to find the minimum button presses required to set the indicators to the target state
  # rubocop:disable Metrics/MethodLength
  def min_button_presses(machine)
    queue = [[0, 0]] # [indicators, presses]
    visited = [0] # array of indicator states we've seen

    until queue.empty?
      indicators, presses = queue.shift
      return presses if indicators == machine.target_state

      machine.buttons.each do |buttons|
        next_indicators = indicators ^ buttons

        unless visited.include?(next_indicators)
          visited << next_indicators
          queue.push([next_indicators, presses + 1])
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
end
