class Chorduroy::GuitarChord
  attr_reader :position, :tuning, :chord

  def initialize(position, tuning, chord)
    @position = position
    @tuning = tuning
    @chord = chord
  end

  def eligible?
    playable? && root_position? && all_notes_in_chord?
  end

  def root_position?
    notes.last == chord.root
  end

  def playable?
    position.playable?
  end

  def all_notes_in_chord?
    (chord.notes - notes).none?
  end

  def notes
    position.strings.map.with_index do |s, i|
      s && tuning.for_string(i) + s
    end.compact
  end
end
