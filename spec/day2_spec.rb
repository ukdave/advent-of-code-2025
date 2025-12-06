# frozen_string_literal: true

require "spec_helper"
require "day2"

RSpec.describe Day2 do
  describe "#part1" do
    it "returns the sum of invalid IDs in the given ranges" do
      input = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224," \
              "1698522-1698528,446443-446449,38593856-38593862,565653-565659," \
              "824824821-824824827,2121212118-2121212124"
      expect(subject.part1(input)).to eq(1_227_775_554)
    end
  end

  describe "#parse" do
    it "parses ranges from the input string" do
      expect(subject.parse("11-22,95-115,998-1012")).to eq(
        [(11..22), (95..115), (998..1012)]
      )
    end
  end

  describe "#invalid_ids" do
    test_cases = {
      (11..22) => [11, 22],
      (95..115) => [99],
      (998..1012) => [1010],
      (1_188_511_880..1_188_511_890) => [1_188_511_885],
      (222_220..222_224) => [222_222],
      (1_698_522..1_698_528) => [],
      (446_443..446_449) => [446_446],
      (38_593_856..38_593_862) => [38_593_859]
    }
    test_cases.each do |range, expected_invalid_ids|
      it "finds invalid IDs in the range #{range}" do
        expect(subject.invalid_ids(range)).to eq(expected_invalid_ids)
      end
    end
  end

  describe "#invalid_num?" do
    invalid_numbers = [11, 22, 99, 1010, 222_222, 446_446, 38_593_859, 1_188_511_885]
    invalid_numbers.each do |num|
      it "returns true for invalid number #{num}" do
        expect(subject.invalid_num?(num)).to be true
      end
    end

    valid_numbers = [12, 95, 998, 222_220, 446_443, 38_593_856, 1_698_522, 1_188_511_880]
    valid_numbers.each do |num|
      it "returns false for valid number #{num}" do
        expect(subject.invalid_num?(num)).to be false
      end
    end
  end

  describe "#split_string" do
    # rubocop:disable RSpec/MultipleExpectations
    it "splits even-length strings into two equal halves" do
      expect(subject.split_string("1234")).to eq(%w[12 34])
      expect(subject.split_string("123456")).to eq(%w[123 456])
    end

    it "splits odd-length strings with the first half shorter" do
      expect(subject.split_string("12345")).to eq(%w[12 345])
      expect(subject.split_string("1234567")).to eq(%w[123 4567])
    end
    # rubocop:enable RSpec/MultipleExpectations
  end
end
