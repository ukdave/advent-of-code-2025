#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day10"

input = File.read("inputs/day10.txt")
puts Day10.new.part1(input)
puts Day10.new.part2(input)
