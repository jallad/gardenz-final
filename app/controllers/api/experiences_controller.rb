class Api::ExperiencesController < ApiController
  def index
    render json: Experience.all
  end

  def show
    # returns certain user experience
    experiences = Experience.where("user_id =#{params[:id]}")
    if experiences
      render json: experiences
    else
      render json: {error: 'No experiences found'}, status: 404
    end
  end

  def create
    user = User.find(params[:id])
    experience = user.experiences.new(project_name: params[:project], from: params[:from], to: params[:to] , description: params[:desc])
    if experience.save
      render json: experience
    else
      render json: {error: 'Cannot create experience'}, status: 404
    end
  end


end