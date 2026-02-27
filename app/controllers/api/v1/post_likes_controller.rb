class Api::V1::PostLikesController < ApplicationController
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
