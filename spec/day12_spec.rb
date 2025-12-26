# frozen_string_literal: true

require "spec_helper"
require "day12"

RSpec.describe Day12 do
  let(:input) do
    <<~INPUT
      0:
      ###
      ##.
      ##.

      1:
      ###
      ##.
      .##

      2:
      .##
      ###
      ##.

      3:
      ##.
      ###
      ##.

      4:
      ###
      #..
      ###

      5:
      ###
      .#.
      ###

      4x4: 0 0 0 0 2 0
      12x5: 1 0 1 0 2 2
      12x5: 1 0 1 0 3 2
    INPUT
  end

  describe "#part1" do
    it "returns the number regions that can fit all of the presents listed" do
      expect(subject.part1(input)).to eq(2)
      # NOTE: For the real input we don't actually need to do perform any overlapping!
    end
  end

  describe "#parse" do
    # rubocop:disable RSpec/ExampleLength
    it "parses the input into presents and regions" do
      expect(subject.parse(input)).to eq(
        presents: [
          ["###", "##.", "##."],
          ["###", "##.", ".##"],
          [".##", "###", "##."],
          ["##.", "###", "##."],
          ["###", "#..", "###"],
          ["###", ".#.", "###"]
        ],
        regions: [
          { size: [4, 4], present_counts: [0, 0, 0, 0, 2, 0] },
          { size: [12, 5], present_counts: [1, 0, 1, 0, 2, 2] },
          { size: [12, 5], present_counts: [1, 0, 1, 0, 3, 2] }
        ]
      )
    end
    # rubocop:enable RSpec/ExampleLength
  end
end
