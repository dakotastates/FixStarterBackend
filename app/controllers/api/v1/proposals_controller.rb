class Api::V1::PropsoalsController < ApplicationController
before_action :find_proposal, only:[:show, :update, :destroy]
  def index
    @proposals = Proposal.all
    render json: { proposals: ProposalSerializer.new(@proposals) }, status: :created

  end

  def show
    render json: @proposal
  end

  def create
    @problem = Problem.create(problem_params)
    if @problem.valid?
      render json: { problem: ProposalSerializer.new(@proposal) }, status: :created
    else
      render json: { error: 'failed to report proposal' }, status: :not_acceptable
    end
  end

  def update
    if @proposal.update(proposal_params)
      render json: @proposal
    else
      render json:{errors: @proposal.errors.full_messages}
    end
  end

  def destroy
    @proposal.destroy
    render json: @proposal
  end

  private
  def proposal_params
    params.require(:proposal).permit(:title, :description, :problem_id)
  end

  def find_proposal
    @proposal = Proposal.find_by_id(params[:id])
  end
end
