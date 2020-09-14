class Api::V1::ProposalsController < ApplicationController
before_action :find_proposal, only:[:show, :update, :destroy]
skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy]

  def index
    @proposals = Proposal.all
      render json: @proposals
  end

  def show
    render json: @proposal
  end

  def create
    
    @proposal = Proposal.create(proposal_params)
    if @proposal.valid?
      render json: { proposal: ProposalSerializer.new(@proposal) }, status: :created
    else
      render json: { error: 'failed to submit proposal' }, status: :not_acceptable
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
    params.require(:proposal).permit(:title, :description, :problem_id, :user_id)
  end

  def find_proposal
    @proposal = Proposal.find_by_id(params[:id])
  end

end
