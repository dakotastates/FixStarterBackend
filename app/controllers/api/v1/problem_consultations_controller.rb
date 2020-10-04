class Api::V1::ProblemConsultationsController < ApplicationController
  before_action :find_consultation, only:[:show, :update, :destroy]
  skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy]

  def index
    @consultations = ProblemConsultation.all
    render json: @consultations
  end

  def show
    render json: @consultation
  end

  def create

    @consultation = ProblemConsultation.create(consultation_params)
    if @consultation.valid?
      render json: { Consultation: ProblemConsulationSerializer.new(@consultation) }, status: :created
    else
      render json: { error: 'failed to create consulation' }, status: :not_acceptable
    end
  end

  def update
    if @consulation.update(consultation_params)
      render json: @consulation
    else
      render json:{errors: @consulation.errors.full_comments}
    end
  end

  def destroy
    @consulation.destroy
    render json: @consulation
  end

  private
  def consultation_params
    params.require(:consultation).permit( :user_id, :problem_id)
  end

  def find_consultation
    @consultation = ProblemConsultation.find_by_id(params[:id])
  end
end
