# frozen_string_literal: true

require "spec_helper"
require "day11"

RSpec.describe Day11 do
  let(:input) do
    <<~INPUT
      aaa: you hhh
      you: bbb ccc
      bbb: ddd eee
      ccc: ddd eee fff
      ddd: ggg
      eee: out
      fff: out
      ggg: out
      hhh: ccc fff iii
      iii: out
    INPUT
  end

  describe "#part1" do
    it "returns the number of paths from you to out" do
      expect(subject.part1(input)).to eq(5)
    end
  end
end
