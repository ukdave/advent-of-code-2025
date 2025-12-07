#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day5"

input = File.read("inputs/day5.txt")
puts Day5.new.part1(input)
