#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day6"

input = File.read("inputs/day6.txt")
puts Day6.new.part1(input)
