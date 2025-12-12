#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day8"

input = File.read("inputs/day8.txt")
puts Day8.new.part1(input, 1000)
