class Chorduroy::Note
  def self.all
    @all ||= [
      new("A"),
      new("A#/Bb"),
      new("B"),
      new("C"),
      new("C#/Db"),
      new("D"),
      new("D#/Eb"),
      new("E"),
      new("F"),
      new("F#/Gb"),
      new("G"),
      new("G#/Ab"),
    ].freeze
  end

  def self.find(name)
    all.detect { |n| n.name == name }
  end

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def index
    self.class.all.index(self)
  end

  def +(n)
    self.class.all[index - (12 - n)]
  end

  def to_s
    name
  end
end
