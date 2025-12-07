# frozen_string_literal: true

require "spec_helper"
require "day6"

RSpec.describe Day6 do
  let(:input) do
    <<~INPUT
      123 328  51 64
       45 64  387 23
        6 98  215 314
      *   +   *   +
    INPUT
  end

  describe "#part1" do
    it "returns the grand total found by adding together all of the answers to the individual problems" do
      expect(subject.part1(input)).to eq(4_277_556)
    end
  end

  describe "#parse" do
    it "parses the input into individual problems" do
      expect(subject.parse(input)).to eq([[123, 45, 6, "*"],
                                          [328, 64, 98, "+"],
                                          [51, 387, 215, "*"],
                                          [64, 23, 314, "+"]])
    end
  end

  describe "#solve" do
    it "solves addition problems" do
      expect(subject.solve([1, 2, 3, "+"])).to eq(6)
    end

    it "solves multiplication problems" do
      expect(subject.solve([2, 3, 4, "*"])).to eq(24)
    end

    it "raises an error for unknown operators" do
      expect { subject.solve([1, 2, 3, "-"]) }.to raise_error("Unknown operator: -")
    end
  end
end
