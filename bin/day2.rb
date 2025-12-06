#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day2"

input = File.read("inputs/day2.txt")
puts Day2.new.part1(input)
puts Day2.new.part2(input)
