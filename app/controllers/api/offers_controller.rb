class Api::OffersController < ApiController
  def index
    render json: Offer.all, include: :offer_detail
  end

  def show
    offer = Offer.find_by(id: params[:id])
    if offer
      render json: offer, include: :offer_detail
    else
      render json: {error: 'offer not found'}, status: 404
    end
  end

  def search
    if params[:request]
      render json: Offer.where("request_id =#{params[:request]}"), include: :offer_detail
    else if params[:user]
           render json: Offer.where("user_id =#{params[:user]}"), include: :offer_detail
         else
           render json: {error: 'No offers found, search query missing'}, status: 404
         end
    end
  end

  def create
    user = User.find(params[:id])
    request = Request.find(params[:request_id])
    if user && request && params[:value]
      offer = user.offers.new(value: params[:value])
      offer.request = request
      if offer.save
        if params[:days] || params[:desc]
          offerDetail = OfferDetail.new(days: params[:days], description: params[:desc])
          offerDetail.offer = offer
          if offerDetail.save
            offer.offer_detail = offerDetail
            render json: offer, include: :offer_detail
          else
            render json: offer
            render json: {error: 'Offer created, with no details'}, status: 404
          end
        else
          render json: offer
        end
      else
        render json: {error: 'Cannot create offer'}, status: 404
      end
    else
      render json: {error: 'User, Request or value not found to add offer, make sure of sent parameters'}, status: 404
    end
  end

  def destroy

    offer = Offer.find(params[:id])
    if offer.destroy
      render json: {message: 'offer deleted'}, status: :ok
    else
      render json: {error: 'Cannot delete offer'}, status: :unprocessable_entity
    end
  end

end