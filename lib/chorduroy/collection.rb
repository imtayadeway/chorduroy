class Chorduroy::Collection
  def initialize(tuning)
    @tuning = tuning
  end

  def for_chord(chord)
    all[chord] or raise all.inspect
  end

  def all
    result = Hash.new { |hash, key| hash[key] = [] }
    Chorduroy::Chord.all.each_with_object(result) do |chord, acc|
      positions = Chorduroy::Generator.generate(chord, tuning)
      acc[chord.name].concat(positions)
      positions.select(&:barreable?).each do |position|
        (1..8).each do |degree|
          acc[(chord + degree).name] << position.transpose(degree)
        end
      end
    end
  end

  private

  attr_reader :tuning
end
