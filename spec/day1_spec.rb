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
end
