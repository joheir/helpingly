class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save
  end

  def show
    @offer = Offer.find(params[:id])
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :date, :hourly_rate, :location, :photo)
  end
end
