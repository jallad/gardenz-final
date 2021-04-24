class Api::AddressesController < ApiController
  def index
    render json: UserAddress.all
  end

  def show
    # Retrieve the address for the user id passed
    user = User.find_by(id: params[:id])
    if user
      address = user.user_address
      if address
        render json: address
      else
        render json: {error: "user doesn't have address"}, status: 404
      end
    else
      render json: {error: "user not found"}, status: 404
    end

  end

  def search
    if params[:address]
      address = UserAddress.where("street LIKE ? OR city LIKE ? OR country LIKE ?", "%#{params[:address]}%", "%#{params[:address]}%", "%#{params[:address]}%")
      if address
        render json: address
      end
    else
      render json: {error: 'No address was found, search query missing'}, status: 404
    end
  end

end