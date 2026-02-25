class Api::V1::UsersController < ApplicationController
  def index
    users = Users::Index.new(is_active: true).call
    render json: users, status: :ok
  end

  def show
    user = Users::FindUser.new.call(params[:id])
    render json: user, status: :ok
  end

  def create
    user = Users::CreateUser.new.call(user_params)
    render json: user, status: :created
  end

  def update
    user = Users::UpdateUser.new.call(params[:id], user_params)
    render json: user
  end

  def destroy
    Users::DestroyUser.new.call(params[:id])
    head :no_content
  end

  def inactive
    Users::InactiveUser.new.call(params[:user_id])
    head :no_content
  end

  private

  def user_params
    params.permit(:name, :last_name, :age, :email, :is_active)
  end
end
