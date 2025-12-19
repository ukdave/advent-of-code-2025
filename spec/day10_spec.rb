# frozen_string_literal: true

require "spec_helper"
require "day10"

RSpec.describe Day10 do
  let(:input) do
    <<~INPUT
      [.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
      [...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
      [.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
    INPUT
  end

  describe "#part1" do
    it "returns fewest button presses required to correctly configure the indicator lights on all of the machines" do
      expect(subject.part1(input)).to eq(7)
    end
  end

  describe Day10::Machine do
    describe ".from_line" do
      it "parses the machine configuration from a line of input" do
        machine = described_class.from_line("[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}")
        expect(machine).to have_attributes(target_state: 0b0110,
                                           buttons: [0b1000, 0b1010, 0b0100, 0b1100, 0b0101, 0b0011])
      end
    end
  end
end
