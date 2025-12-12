# frozen_string_literal: true

require "spec_helper"
require "day8"

RSpec.describe Day8 do
  let(:input) do
    <<~INPUT
      162,817,812
      57,618,57
      906,360,560
      592,479,940
      352,342,300
      466,668,158
      542,29,236
      431,825,988
      739,650,466
      52,470,668
      216,146,977
      819,987,18
      117,168,530
      805,96,715
      346,949,466
      970,615,88
      941,993,340
      862,61,35
      984,92,344
      425,690,689
    INPUT
  end

  describe "#part1" do
    it "returns the size of the 3 largest circuits multiplied together" do
      expect(subject.part1(input, 10)).to eq(40)
    end
  end

  describe "#part2" do
    it "returns the X coordinates of the last to junction boxes need to form a single circuit multiplied together" do
      expect(subject.part2(input)).to eq(25_272)
    end
  end
end
