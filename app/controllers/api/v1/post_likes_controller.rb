class Api::V1::PostLikesController < ApplicationController
  def index
    puts params[:user_id]
    likes = Posts::LikePostQuery.new
      .by_user(params[:user_id])
      .by_post(params[:post_id])
      .recent
      .call
    render json: likes, status: :ok
  end

  def create
    like = Posts::LikePost.new.call(like_params)
    render json: like, status: :created
  end

  def destroy
    Posts::UnlikePost.new.call(params[:id])
    head :no_content
  end

  private

  def like_params
    params.permit(:user_id, :post_id)
  end
end
