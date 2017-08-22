class CommentsController < ApplicationController
  def index
    if params[:author_id]
      @comments = Comment.where(author_id: params[:author_id])
    elsif params[:artwork_id]
      @comments = Comment.where(author_id: params[:author_id])
    else
      @comments = Comment.all
    end
    if @comments
      render json: @comments
    else
      render json: @comments.errors.full_messages, status: 404
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: 404
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author_id, :artwork_id)
  end
end
