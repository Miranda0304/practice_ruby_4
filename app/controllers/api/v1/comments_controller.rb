class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comments::Index.new.call
    render json: comments, status: :ok
  end

  def create
    comment = Comments::CreateComment.new.call(comment_params)
    render json: comment, status: :created
  end

  def update
    comment = Comments::UpdateComment.new.call(params[:id], comment_params)
    render json: comment
  end

  def destroy
    Comments::DestroyComment.new.call(params[:id])
    head :no_content
  end

  def soft_delete
    Comments::SoftDelete.new.call(params[:comment_id])
    head :no_content
  end

  private

  def comment_params
    params.permit(:post_id, :user_id, :body)
  end
end
