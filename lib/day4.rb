# frozen_string_literal: true

class Day4
  DIRECTIONS = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]
  ].freeze

  def part1(input)
    grid = parse(input)
    count = 0
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        count += 1 if cell == "@" && number_of_adjacent_rols(grid, col_idx, row_idx) < 4
      end
    end
    count
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def part2(input)
    grid = parse(input)
    count = 0
    loop do
      rolls_to_remove = []
      grid.each_with_index do |row, row_idx|
        row.each_with_index do |cell, col_idx|
          rolls_to_remove << [row_idx, col_idx] if cell == "@" && number_of_adjacent_rols(grid, col_idx, row_idx) < 4
        end
      end
      rolls_to_remove.each { |row_idx, col_idx| grid[row_idx][col_idx] = "." }
      count += rolls_to_remove.length
      break if rolls_to_remove.empty?
    end
    count
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def parse(input)
    input.each_line.map { it.chomp.chars }
  end

  # rubocop:disable Naming/MethodParameterName
  def number_of_adjacent_rols(grid, x, y)
    DIRECTIONS.sum do |x_offset, y_offset|
      new_x = x + x_offset
      new_y = y + y_offset
      next 0 unless new_x.between?(0, grid[0].length - 1) && new_y.between?(0, grid.length - 1)

      grid[new_y][new_x] == "@" ? 1 : 0
    end
  end
  # rubocop:enable Naming/MethodParameterName
end
