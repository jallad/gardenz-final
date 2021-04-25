class Api::UsersController < ApiController
  before_action :authenticate_user
  before_action :set_user, only: [:show, :update, :destroy]

  def index

    render json: User.all, each_serializer: UserSerializer
  end

  def show
    #Rails.logger.info current_user.inspect
    render json: @user, serializer: UserSerializer
  end

  def create

      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end


end