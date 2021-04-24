class Api::RequestsController < ApiController
  def index
    render json: Request.all
  end

  def show
    request = Request.find_by(id: params[:id])
    if request
      render json: request, include: :offers
    else
      render json: {error: 'Request not found'}, status: 404
    end
  end

  def search
    if params[:subject]
      render json: Request.where('subject LIKE ?', "%#{params[:subject]}%")
      else if params[:desc]
             render json: Request.where('description LIKE ?', "%#{params[:desc]}%")
           else
             render json: {error: 'Request not found, search query missing'}, status: 404
           end
    end
  end

  def create
    request = Request.new(subject: params[:subject], description: params[:desc])
    if request.save
      render json: request
    else
      render json: {error: 'Cannot create request'}, status: 404
    end
  end

end