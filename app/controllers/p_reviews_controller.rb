class PReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

def index
  @p_definition = PDefinition.find(params[:p_definition_id])
  @p_reviews = @p_definition.p_reviews
end

def create
  @p_review = PReview.new(p_review_params)
  @p_review.user_id = current_user.id
  @p_definition = PDefinition.find(params[:p_definition_id])
  @p_definition.create_notification_p_review!(current_user)
  if @p_review.save
    redirect_to p_definition_p_reviews_path(@p_review.p_definition)
  else
    render "p_definitions/show"
  end
end

def new
  @p_definition = PDefinition.find(params[:p_definition_id])
  @p_reviews = @p_definition.p_reviews
  @p_review = PReview.new
  @todays_date = Date.today
end

  private
  def p_review_params
    params.require(:p_review).permit(:p_definition_id, :score, :content)
  end
end
