class Chorduroy::Position
  MAX_FINGERS = 4
  MAX_REACH = 3

  attr_reader :strings

  def initialize(strings)
    @strings = strings
  end

  def to_ascii
    strings.map { |s| "---#{s || "X"}---" }.join("\n") + "\n"
  end

  def playable?
    return true if fretted.none?
    return false if fretted.size > MAX_FINGERS
    return false if strings[5] && !strings[4]
    fretted.max - fretted.min <= MAX_REACH
  end

  def barreable?
    return true if fretted.none?
    return false if fretted.size > 3
    return false if fretted.max > 3
    true
  end

  def transpose(frets)
    position = strings.map do |string|
      string && string + frets
    end
    self.class.new(position)
  end

  private

  def fretted
    strings.reject { |s| s.nil? || s.zero? }
  end
end
