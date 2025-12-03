# frozen_string_literal: true

require "spec_helper"
require "day1"

RSpec.describe Day1 do
  let(:input) do
    <<~INPUT
      L68
      L30
      R48
      L5
      R60
      L55
      L1
      L99
      R14
      L82
    INPUT
  end

  describe "#part1" do
    it "returns the number of times the dial is left pointing at 0 after any rotation in the sequence" do
      expect(subject.part1(input)).to eq(3)
    end
  end

  describe "#part2" do
    it "returns the number of times any click causes the dial to point at 0, regardless of whether it happens during " \
       "a rotation or at the end of one" do
      expect(subject.part2(input)).to eq(6)
    end

    test_cases = {
      "L5" => 0,
      "R5" => 0,
      "L50" => 1,
      "R50" => 1,
      "L51" => 1,
      "R51" => 1,
      "L150" => 2,
      "R150" => 2,
      "L151" => 2,
      "R151" => 2,
      "L49\nL5" => 1,
      "R49\nR5" => 1,
      "L50\nL5" => 1,
      "R50\nR5" => 1,
      "L51\nL5" => 1,
      "R51\nR5" => 1,
      "L200" => 2,
      "R200" => 2,
      "L1000" => 10,
      "R1000" => 10,
      "L50\nL200" => 3,
      "R50\nR200" => 3
    }
    test_cases.each do |directions, expected_zero_count|
      it "with #{directions.tr("\n", ",")} returns #{expected_zero_count}" do
        expect(subject.part2(directions)).to eq(expected_zero_count)
      end
    end
  end
end
