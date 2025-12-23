#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day11"

input = File.read("inputs/day11.txt")
puts Day11.new.part1(input)
puts Day11.new.part2(input)
