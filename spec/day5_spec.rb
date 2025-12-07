# frozen_string_literal: true

require "spec_helper"
require "day5"

RSpec.describe Day5 do
  let(:input) do
    <<~INPUT
      3-5
      10-14
      16-20
      12-18

      1
      5
      8
      11
      17
      32
    INPUT
  end

  describe "#part1" do
    it "returns the number of available ingredient IDs that are fresh" do
      expect(subject.part1(input)).to eq(3)
    end
  end

  describe "#part2" do
    it "returns the number of ingredient IDs are considered to be fresh" do
      expect(subject.part2(input)).to eq(14)
    end
  end

  describe "#merge_ranges" do
    it "merges overlapping and adjacent ranges" do
      ranges = [(1..5), (6..10), (12..15), (14..20), (22..25)]
      combined = subject.merge_ranges(ranges)
      expect(combined).to eq([(1..10), (12..20), (22..25)])
    end
  end
end
