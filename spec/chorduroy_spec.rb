require "spec_helper"

RSpec.describe Chorduroy do
  describe ".generate" do
    it "generates some chord symbols" do
      collection = described_class.generate("E", "A", "D", "G", "B", "E")

      expected = an_object_having_attributes(strings: [0, 0, 1, 2, 2, 0])
      expect(collection.for_chord("E major")).to include(expected)
    end
  end
end
