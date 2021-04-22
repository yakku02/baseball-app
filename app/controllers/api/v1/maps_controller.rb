class Api::V1::MapsController < ApiController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def new
    @school = Category.where(ancestry: params[:tournament_id])
    render 'new', formats: 'json', handlers: 'jbuilder'
  end

  def create
    map = Map.create(map_params)
    if map.save
      render json: map, status: :created
    else
      render json: { errors: map.errors.keys.map { |key| [key, map.errors.full_messages_for(key)]}.to_h, render: 'show.json.jbuilder' }, status: :unprocessable_entity
    end
  end

  def index
    @maps = Map.where(tournament_id: params[:tournament_id]).includes(:user).order("created_at DESC")
    @id = params[:tournament_id]
    @categories = Category.where(ancestry: nil)
    @tournament = Category.find_by(id: @id)
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def show
    @map = Map.find(params[:id])
    render 'show',formats: 'json', handlers: 'jbuilder'
  end

  private

  def map_params
    params.permit(:address,:school_id,:text,:tournament_id,:image).merge(user_id: current_user.id)
  end
end