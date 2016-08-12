class Chorduroy::Generator
  FRETS = 0..7

  def self.generate(chord, tuning)
    new(chord, tuning).generate
  end

  attr_reader :chord, :tuning

  def initialize(chord, tuning)
    @chord = chord
    @tuning = tuning
  end

  def generate
    positions.map do |position|
      Chorduroy::GuitarChord.new(Chorduroy::Position.new(position), tuning, chord)
    end.select(&:eligible?).map(&:position)
  end

  def positions
    result = []

    tuning.each_with_index do |open_string, string_number|
      result[string_number] = FRETS.select do |fret|
        chord.include?(open_string + fret)
      end

      result[string_number] << nil if string_number > 4
    end

    first, *rest = result
    first.product(*rest)
  end
end
