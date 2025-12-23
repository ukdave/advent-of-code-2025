# frozen_string_literal: true

require "spec_helper"
require "day11"

RSpec.describe Day11 do
  describe "#part1" do
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

    it "returns the number of paths from 'you' to 'out'" do
      expect(subject.part1(input)).to eq(5)
    end
  end

  describe "#part2" do
    let(:input) do
      <<~INPUT
        svr: aaa bbb
        aaa: fft
        fft: ccc
        bbb: tty
        tty: ccc
        ccc: ddd eee
        ddd: hub
        hub: fff
        eee: dac
        dac: fff
        fff: ggg hhh
        ggg: out
        hhh: out
      INPUT
    end

    it "returns the number of paths from 'svr' to 'out' that visit both 'dac' and 'fft'" do
      expect(subject.part2(input)).to eq(2)
    end
  end
end
