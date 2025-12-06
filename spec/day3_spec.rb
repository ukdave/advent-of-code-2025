# frozen_string_literal: true

require "spec_helper"
require "day3"

RSpec.describe Day3 do
  let(:input) do
    <<~INPUT
      987654321111111
      811111111111119
      234234234234278
      818181911112111
    INPUT
  end

  describe "#part1" do
    it "returns the total output joltage from the bank of batteries" do
      expect(subject.part1(input)).to eq(357)
    end
  end

  describe "#part2" do
    it "returns the total output joltage from the bank of batteries" do
      expect(subject.part2(input)).to eq(3_121_910_778_619)
    end
  end

  describe "#max_joltage" do
    test_cases = {
      [9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1] => 98,
      [8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9] => 89,
      [2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 7, 8] => 78,
      [8, 1, 8, 1, 8, 1, 9, 1, 1, 1, 1, 2, 1, 1, 1] => 92
    }
    test_cases.each do |batteries, expected_max|
      it "returns #{expected_max} for batteries #{batteries}" do
        expect(subject.max_joltage(batteries)).to eq(expected_max)
      end
    end
  end

  describe "#max_joltage2" do
    test_cases = {
      [9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1] => 987_654_321_111,
      [8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9] => 811_111_111_119,
      [2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 7, 8] => 434_234_234_278,
      [8, 1, 8, 1, 8, 1, 9, 1, 1, 1, 1, 2, 1, 1, 1] => 888_911_112_111
    }
    test_cases.each do |batteries, expected_max|
      it "returns #{expected_max} for batteries #{batteries}" do
        expect(subject.max_joltage2(batteries)).to eq(expected_max)
      end
    end
  end
end
