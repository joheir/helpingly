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
    @offer.user = current_user
      if @offer.save
        redirect_to @offer, notice: "Offer was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path, notice: "Offer was successfully deleted."
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :hourly_rate, :location, :photo)
  end
end
