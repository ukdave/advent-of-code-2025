#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << "lib"
require "day7"

input = File.read("inputs/day7.txt")
puts Day7.new.part1(input)
