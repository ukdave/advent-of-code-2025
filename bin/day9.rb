#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day9"

input = File.read("inputs/day9.txt")
puts Day9.new.part1(input)
