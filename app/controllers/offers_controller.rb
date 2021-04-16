class OffersController < ApplicationController
  before_action :get_selected_request, only: [:create, :destroy]

  # def create
  #   byebug
  #   @offer = @request.offers.new(offer_params)
  #   @offer.user_id = Current.user.id
  #   if @offer.save
  #     redirect_to @request, notice: "Offer successfully added"
  #   else
  #     redirect_to @request, alert: "Something went wrong!"
  #   end
  # end
  #

  def create
    offer_detail_params = offer_params.delete(:offer_detail)
    @offer = @request.offers.new(offer_params)
    @offer.user_id = Current.user.id
    if @offer.save
      if offer_detail_params.present?
        offer_detail = OfferDetail.new(offer_detail_params)
        offer_detail.offer = @offer
        offer_detail.save
      end
      redirect_to @request, notice: "Offer successfully added"
    else
      redirect_to @request, alert: "Something went wrong!"
    end
  end

  def destroy
    @offer = @request.offers.find(params[:id])
    @offer.destroy
    redirect_to @request, notice: "Offer deleted"
  end

  private

  def get_selected_request
    @request = Request.find(params[:request_id])
  end

  def offer_params
    #params.require(:offer).permit(:value, :days, :description)
    params.require(:offer).permit!
    #params.require(:offer).permit(:value, offer_detail_attributes: [:days, :description])
  end
end
