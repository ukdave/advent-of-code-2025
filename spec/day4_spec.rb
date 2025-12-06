# frozen_string_literal: true

require "spec_helper"
require "day4"

RSpec.describe Day4 do
  let(:input) do
    <<~INPUT
      ..@@.@@@@.
      @@@.@.@.@@
      @@@@@.@.@@
      @.@@@@..@.
      @@.@@@@.@@
      .@@@@@@@.@
      .@.@.@.@@@
      @.@@@.@@@@
      .@@@@@@@@.
      @.@.@@@.@.
    INPUT
  end

  describe "#part1" do
    it "returns the number of rolls of paper can be accessed by a forklift" do
      expect(subject.part1(input)).to eq(13)
    end
  end

  describe "#part2" do
    it "returns the number of rolls in total that can be removed by a forklift" do
      expect(subject.part2(input)).to eq(43)
    end
  end
end
