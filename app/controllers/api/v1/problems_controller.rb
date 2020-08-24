class Api::V1::ProblemsController < ApplicationController

  def index
  problems = Problem.all
  end

  private
  def problem_params
    params.require(:problem).permit(:problemTitle, :description, :longitude, :latitude)
  end
end
