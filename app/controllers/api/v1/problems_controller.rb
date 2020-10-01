class Api::V1::ProblemsController < ApplicationController
before_action :find_problem, only:[:show, :update, :destroy]
skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy]
  def index

    @problems = Problem.all
    render json: @problems

  end

  def show
    render json: @problem
  end

  def create

    @problem = Problem.create(problem_params)
    if @problem.valid?
      render json: { problem: ProblemSerializer.new(@problem) }, status: :created
    else
      render json: { error: 'failed to report problem' }, status: :not_acceptable
    end
  end

  def update
    if @problem.update(problem_params)
      render json: @problem
    else
      render json:{errors: @problem.errors.full_messages}
    end
  end

  def destroy
    @problem.destroy
    render json: @problem
  end

  private
  def problem_params
    params.require(:problem).permit(:problemTitle, :description, :longitude, :latitude, :user_id, :status)
  end

  def find_problem
    @problem = Problem.find_by_id(params[:id])
  end
end
