class Api::V1::MessagesController < ApplicationController
before_action :find_message, only:[:show, :update, :destroy]
skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy]
  def index

    @messages = Messages.all
    render json: @messages

  end

  def show
    render json: @message
  end

  def create

    @message = Message.create(message_params)
    if @message.valid?
      render json: { message: MessageSerializer.new(@message) }, status: :created
    else
      render json: { error: 'failed to Sent Message' }, status: :not_acceptable
    end
  end

  def update
    if @message.update(message_params)
      render json: @message
    else
      render json:{errors: @message.errors.full_messages}
    end
  end

  def destroy
    @message.destroy
    render json: @message
  end

  private
  def message_params
    params.require(:message).permit(:message, :user_id, :recipient_id, :viewed)
  end

  def find_message
    @message = Message.find_by_id(params[:id])
  end
end
