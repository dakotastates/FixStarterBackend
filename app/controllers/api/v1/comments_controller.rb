class Api::V1::CommentsController < ApplicationController
before_action :find_comment, only:[:show, :update, :destroy]
skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy]
  def index

    @comments = comments.all
    render json: @comments

  end

  def show
    render json: @comment
  end

  def create

    @comment = comment.create(comment_params)
    if @comment.valid?
      render json: { comment: commentSerializer.new(@comment) }, status: :created
    else
      render json: { error: 'failed to Sent Comment' }, status: :not_acceptable
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json:{errors: @comment.errors.full_comments}
    end
  end

  def destroy
    @comment.destroy
    render json: @comment
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :recipient_id)
  end

  def find_comment
    @comment = comment.find_by_id(params[:id])
  end
end
