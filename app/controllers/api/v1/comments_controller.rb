class Api::V1::CommentsController < ApiController

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    @comments = Comment.where(tweet_id: params[:tweet_id])
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment,status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,tweet_id: params[:tweet_id])
  end
end