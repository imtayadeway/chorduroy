require "spec_helper"

RSpec.describe Chorduroy::Generator do
  describe ".generate" do
    it "will generate the positions for a given chord in a given tuning" do
      chord = double("MajorTriad", notes: [Chorduroy::Note.find("E"), Chorduroy::Note.find("G#/Ab"), Chorduroy::Note.find("B")], root: Chorduroy::Note.find("E"), include?: true)
      tuning = Chorduroy::Tuning.standard

      actual = described_class.generate(chord, tuning)
      expected = an_object_having_attributes(strings: [0, 0, 1, 2, 2, 0])
      expect(actual).to include(expected)
    end

    it "won't give you unplayable positions" do
      chord = double("MajorTriad", notes: [Chorduroy::Note.find("E"), Chorduroy::Note.find("G#/Ab"), Chorduroy::Note.find("B")], root: Chorduroy::Note.find("E"), include?: true)
      tuning = Chorduroy::Tuning.standard

      actual = described_class.generate(chord, tuning)
      an_impossible_to_play_e = an_object_having_attributes(strings: [12, 12, 1, 2, 2, 12])
      expect(actual).not_to include(an_impossible_to_play_e)
    end

    it "will generate things with mute strings"
  end
end
