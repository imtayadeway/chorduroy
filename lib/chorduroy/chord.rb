module Chorduroy
  class Chord
    def self.all
      @all ||= Chorduroy::Note.all.flat_map do |note|
        [MajorTriad.new(note), MinorTriad.new(note)]
      end
    end

    def +(degree)
      self.class.all.detect do |chord|
        chord.is_a?(self.class) && chord.root == root + degree
      end
    end

    attr_reader :root

    def initialize(root)
      @root = root
    end

    def name
      raise "Not implemented"
    end

    def notes
      raise "Not implemented"
    end

    def include?(note)
      notes.include?(note)
    end
  end

  class Triad < Chord
    def third
      raise "Not implemented"
    end

    def fifth
      raise "Not implemented"
    end

    def notes
      [root, third, fifth]
    end
  end

  class MajorTriad < Triad
    def third
      root + 4
    end

    def fifth
      root + 7
    end

    def name
      "#{root} major"
    end
  end

  class MinorTriad < Triad
    def third
      root + 3
    end

    def fifth
      root + 7
    end

    def name
      "#{root} minor"
    end
  end
end
