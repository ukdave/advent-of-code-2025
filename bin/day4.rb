#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day4"

input = File.read("inputs/day4.txt")
puts Day4.new.part1(input)
puts Day4.new.part2(input)
