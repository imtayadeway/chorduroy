require "spec_helper"

RSpec.describe Chorduroy::Collection do
  it "generates a collection of chord positions for a given tuning" do
    tuning = Chorduroy::Tuning.standard
    collection = described_class.new(tuning)

    expected = an_object_having_attributes(strings: [0, 0, 1, 2, 2, 0])
    expect(collection.for_chord("E major")).to include(expected)
  end

  it "includes the list of major chords" do
    tuning = Chorduroy::Tuning.standard
    collection = described_class.new(tuning)

    expected = an_object_having_attributes(strings: [3, 0, 0, 0, 2, 3])
    expect(collection.for_chord("G major")).to include(expected)
  end

  it "includes the list of minor chords" do
    tuning = Chorduroy::Tuning.standard
    collection = described_class.new(tuning)

    expected = an_object_having_attributes(strings: [0, 0, 0, 2, 2, 0])
    expect(collection.for_chord("E minor")).to include(expected)
  end

  it "does not include another tuning's chords" do
    tuning = Chorduroy::Tuning.standard
    collection = described_class.new(tuning)

    expected = an_object_having_attributes(strings: [0, 0, 0, 0, 0, 0])
    expect(collection.for_chord("G major")).not_to include(expected)
  end

  it "can accept non-standard tunings" do
    tuning = Chorduroy::Tuning.open_g
    collection = described_class.new(tuning)

    expected = an_object_having_attributes(strings: [0, 0, 0, 0, 0, nil])
    expect(collection.for_chord("G major")).to include(expected)
  end

  it "includes the list of all chords" do
    tuning = Chorduroy::Tuning.standard
    collection = described_class.new(tuning)

    expect(collection.all).to include(*Chorduroy::Chord.all.map(&:name))
  end
end
