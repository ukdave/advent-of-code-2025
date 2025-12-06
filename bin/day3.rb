#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day3"

input = File.read("inputs/day3.txt")
puts Day3.new.part1(input)
