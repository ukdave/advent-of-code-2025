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
end
