class Api::V1::PostsController < ApplicationController
  def index
    posts = Posts::Index.new.call
    render json: posts, status: :ok
  end

  def show
    post = Posts::FindPost.new.call(params[:id])
    render json: post, status: :ok
  end

  def create
    post = Posts::CreatePost.new.call(post_params)
    render json: post, status: :created
  end

  def update
    post = Posts::UpdatePost.new.call(params[:id], post_params)
    render json: post
  end

  def destroy
    Posts::DestroyPost.new.call(params[:id])
    head :no_content
  end

  def soft_delete
    Posts::SoftDelete.new.call(params[:post_id])
    head :no_content
  end

  private

  def post_params
    params.permit(:user_id, :title, :content, :is_active, :is_deleted)
  end
end
