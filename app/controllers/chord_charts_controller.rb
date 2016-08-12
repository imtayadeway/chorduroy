class ChordChartsController < ApplicationController
  def index
  end

  def results
    @chord_chart = Chorduroy.generate(
      params["6th"],
      params["5th"],
      params["4th"],
      params["3rd"],
      params["2nd"],
      params["1st"],
    )
  end
end
