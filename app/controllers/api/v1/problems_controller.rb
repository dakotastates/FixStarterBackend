class Api::V1::ProblemsController < ApplicationController

  def index
    problems = Problem.all
    render json: { problems: ProblemSerializer.new(@problems) }, status: :created

  end

  def create
    @problem = Problem.create(problem_params)
    if @problem.valid?
      render json: { problem: ProblemSerializer.new(@problem) }, status: :created
    else
      render json: { error: 'failed to report problem' }, status: :not_acceptable
    end
  end

  private
  def problem_params
    params.require(:problem).permit(:problemTitle, :description, :longitude, :latitude)
  end
end
