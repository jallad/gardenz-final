class Api::SkillsController < ApiController
  def index
    render json: Skill.all
  end

  def show
    skill = Skill.find_by(id: params[:id])
    if skill
      render json: skill
    else
      render json: {error: 'skill not found'}, status: 404
    end
  end

  def search
    if params[:name]
      render json: Skill.where('name LIKE ?', "%#{params[:name]}%")
    else
      render json: {error: 'skill not found, search query missing'}, status: 404
    end
  end

end