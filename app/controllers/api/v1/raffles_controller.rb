class Api::V1::RafflesController < ApplicationController
  def index
    raffles = Raffles::Index.new.call
    render json: raffles, status: :ok
  end

  def show
    raffle = Raffles::FindRaffle.new.call(params[:id])
    render json: raffle, status: :ok
  end

  def create
    raffle = Raffles::CreateRaffle.new.call(raffle_params)
    render json: raffle, status: :created
  end

  def update
    raffle = Raffles::UpdateRaffle.new.call(params[:id], raffle_params)
    render json: raffle
  end

  def finish
    raffle = Raffles::FinishRaffle.new.call(params[:raffle_id])
    render json: raffle
  end

  def soft_delete
    Raffles::SoftDeleteRaffle.new.call(params[:raffle_id])
    head :no_content
  end

  private

  def raffle_params
    params.permit(:user_id,
                  :title,
                  :description,
                  :prize,
                  :total_numbers,
                  :price,
                  :number_per_page,
                  :url_icon,
                  :limit_to_finish,
                  :start_date,
                  :end_date,
                  :number_winner,
                  :url_evidence,
                  :status)
  end
end
