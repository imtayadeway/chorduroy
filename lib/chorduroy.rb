module Chorduroy
  require "chorduroy/collection"
  require "chorduroy/position"
  require "chorduroy/generator"
  require "chorduroy/tuning"
  require "chorduroy/note"
  require "chorduroy/chord"
  require "chorduroy/guitar_chord"

  def self.generate(sixth, fifth, fourth, third, second, first)
    tuning = Tuning.new(
      [
        Note.find(first),
        Note.find(second),
        Note.find(third),
        Note.find(fourth),
        Note.find(fifth),
        Note.find(sixth),
      ]
    )
    Collection.new(tuning)
  end
end
