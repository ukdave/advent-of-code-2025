# frozen_string_literal: true

require "spec_helper"
require "day9"

RSpec.describe Day9 do
  let(:input) do
    <<~INPUT
      7,1
      11,1
      11,7
      9,7
      9,5
      2,5
      2,3
      7,3./
    INPUT
  end

  describe "#part1" do
    it "returns the largest area of any rectangle you can make" do
      expect(subject.part1(input)).to eq(50)
    end
  end

  describe "#area" do
    it "returns the rectangular area formed by two points" do
      point1 = Day9::Point.new(x: 2, y: 5)
      point2 = Day9::Point.new(x: 11, y: 1)
      expect(subject.area(point1, point2)).to eq(50)
    end

    it "returns the area for rectangles with a width or length of 1" do
      point1 = Day9::Point.new(x: 2, y: 3)
      point2 = Day9::Point.new(x: 7, y: 3)
      expect(subject.area(point1, point2)).to eq(6)
    end

    it "returns an area of 1 for duplicate points" do
      point1 = Day9::Point.new(x: 3, y: 3)
      point2 = Day9::Point.new(x: 3, y: 3)
      expect(subject.area(point1, point2)).to eq(1)
    end
  end
end
