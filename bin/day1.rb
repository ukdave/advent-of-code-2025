#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day1"

input = File.read("inputs/day1.txt")
puts Day1.new.part1(input)
puts Day1.new.part2(input)
