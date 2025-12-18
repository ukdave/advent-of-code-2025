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
      7,3
    INPUT
  end

  describe "#part1" do
    it "returns the largest area of any rectangle you can make" do
      expect(subject.part1(input)).to eq(50)
    end
  end

  describe "#part2" do
    it "returns the largest area of any rectangle you can make using only red and green tiles" do
      expect(subject.part2(input)).to eq(24)
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

  describe "#build_rectangle" do
    it "returns a polygon representing a rectangle defined by two diagonal points" do
      point1 = Day9::Point.new(x: 2, y: 5)
      point2 = Day9::Point.new(x: 7, y: 3)
      rectangle = subject.build_rectangle(point1, point2)
      expect(rectangle.points).to eq [Day9::Point.new(x: 2, y: 3),
                                      Day9::Point.new(x: 7, y: 3),
                                      Day9::Point.new(x: 7, y: 5),
                                      Day9::Point.new(x: 2, y: 5)]
    end
  end

  describe "#rectangle_in_polygon?" do
    it "returns true if the rectangle is fully inside the polygon" do
      polygon = Day9::Polygon.new(points: [Day9::Point.new(x: 1, y: 1),
                                           Day9::Point.new(x: 5, y: 1),
                                           Day9::Point.new(x: 5, y: 5),
                                           Day9::Point.new(x: 1, y: 5)])
      rectangle = subject.build_rectangle(Day9::Point.new(x: 2, y: 2), Day9::Point.new(x: 4, y: 4))
      expect(subject.rectangle_in_polygon?(rectangle, polygon)).to be(true)
    end

    it "returns true if the rectangle is the same size as the polygon" do
      polygon = Day9::Polygon.new(points: [Day9::Point.new(x: 1, y: 1),
                                           Day9::Point.new(x: 5, y: 1),
                                           Day9::Point.new(x: 5, y: 5),
                                           Day9::Point.new(x: 1, y: 5)])
      rectangle = subject.build_rectangle(Day9::Point.new(x: 1, y: 1), Day9::Point.new(x: 5, y: 5))
      expect(subject.rectangle_in_polygon?(rectangle, polygon)).to be(true)
    end

    it "returns false if any edge of the polygon pierces through the rectangle" do
      polygon = Day9::Polygon.new(points: [Day9::Point.new(x: 1, y: 1),
                                           Day9::Point.new(x: 5, y: 1),
                                           Day9::Point.new(x: 5, y: 5),
                                           Day9::Point.new(x: 4, y: 5),
                                           Day9::Point.new(x: 4, y: 3),
                                           Day9::Point.new(x: 2, y: 3),
                                           Day9::Point.new(x: 2, y: 5),
                                           Day9::Point.new(x: 1, y: 5)])
      rectangle = subject.build_rectangle(Day9::Point.new(x: 1, y: 1), Day9::Point.new(x: 5, y: 5))
      expect(subject.rectangle_in_polygon?(rectangle, polygon)).to be(false)
    end
  end

  describe Day9::Polygon do
    describe "#edges" do
      subject do
        described_class.new(points: [Day9::Point.new(x: 1, y: 1),
                                     Day9::Point.new(x: 5, y: 1),
                                     Day9::Point.new(x: 5, y: 5),
                                     Day9::Point.new(x: 1, y: 5)])
      end

      it "returns the edges for a set of points" do
        expect(subject.edges).to eq [[Day9::Point.new(x: 1, y: 1), Day9::Point.new(x: 5, y: 1)],
                                     [Day9::Point.new(x: 5, y: 1), Day9::Point.new(x: 5, y: 5)],
                                     [Day9::Point.new(x: 5, y: 5), Day9::Point.new(x: 1, y: 5)],
                                     [Day9::Point.new(x: 1, y: 5), Day9::Point.new(x: 1, y: 1)]]
      end
    end

    describe "#bounding_box" do
      subject do
        described_class.new(points: [Day9::Point.new(x: 3, y: 1),
                                     Day9::Point.new(x: 5, y: 3),
                                     Day9::Point.new(x: 3, y: 5),
                                     Day9::Point.new(x: 1, y: 5)])
      end

      it "returns the bounding box for a set of points" do
        expect(subject.bounding_box).to eq({ min_x: 1, max_x: 5, min_y: 1, max_y: 5 })
      end
    end
  end
end
