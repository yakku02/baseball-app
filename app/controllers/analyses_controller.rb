class AnalysesController < ApplicationController
  before_action :set_category, only:[:new,:create]
  def index
  end

  def new
    @analysis = Analysis.new
    respond_to do |format|
      format.html
      format.json do
      @category_children = Category.find(params[:tournament_id]).children
      end
    end
  end

  def create
    @analyses = Analysis.create(analysis_params)
    # binding.pry
    render "new" unless @analyses.save
  end

  private
  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

  def analysis_params
    params.require(:analysis).permit(:text,:tournament_id,:school_id)
  end
end
