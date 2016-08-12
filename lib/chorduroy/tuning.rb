class Chorduroy::Tuning
  include Enumerable

  def self.standard
    new(
      [
        Chorduroy::Note.find("E"),
        Chorduroy::Note.find("B"),
        Chorduroy::Note.find("G"),
        Chorduroy::Note.find("D"),
        Chorduroy::Note.find("A"),
        Chorduroy::Note.find("E"),
      ]
    )
  end

  def self.open_g
    new(
      [
        Chorduroy::Note.find("D"),
        Chorduroy::Note.find("B"),
        Chorduroy::Note.find("G"),
        Chorduroy::Note.find("D"),
        Chorduroy::Note.find("G"),
        Chorduroy::Note.find("D"),
      ]
    )
  end

  attr_reader :strings

  def initialize(strings)
    @strings = strings
  end

  def each
    strings.each { |s| yield s }
  end

  def for_string(number)
    strings[number]
  end
end
