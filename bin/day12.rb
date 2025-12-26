#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day12"

input = File.read("inputs/day12.txt")
puts Day12.new.part1(input)
