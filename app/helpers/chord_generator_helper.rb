module ChordGeneratorHelper
  def notes_of_the_scale
    Chorduroy::Note.all
  end

  def note_options
    notes_of_the_scale.map { |n| [n.name, n.name] }
  end
end
