require "spec_helper"

RSpec.describe Chorduroy::Position do
  describe "#to_ascii" do
    it "renders the position in ascii format" do
      position = described_class.new([0, 0, 1, 2, 2, 0])

      expected = <<ASCII
---0---
---0---
---1---
---2---
---2---
---0---
ASCII

      expect(position.to_ascii).to eq(expected)
    end
  end

  describe "#playable?" do
    it "returns true for a playable position" do
      position = described_class.new([0, 0, 1, 2, 2, 0])
      expect(position).to be_playable
    end

    it "returns false for an unplayable position" do
      position = described_class.new([12, 12, 1, 2, 2, 12])
      expect(position).not_to be_playable
    end

    it "returns false for a position that requires too many fingers" do
      position = described_class.new([1, 2, 3, 1, 2, 3])
      expect(position).not_to be_playable
    end
  end

  it "can handle mute strings"
end
