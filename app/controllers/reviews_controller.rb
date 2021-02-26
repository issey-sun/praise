class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

def index
  @definition = Definition.find(params[:definition_id])
  @reviews = @definition.reviews
end

def create
  @review = Review.new(review_params)
  @review.user_id = current_user.id
  @definition = Definition.find(params[:definition_id])
  @definition.create_notification_review!(current_user)
  if @review.save
    redirect_to definition_reviews_path(@review.definition)
  else
    render "reviews/new"
  end
end

def new
  @definition = Definition.find(params[:definition_id])
  @reviews = @definition.reviews
  @review = Review.new
  @todays_date = Date.today
end


  private
  def review_params
    params.require(:review).permit(:definition_id, :score, :content)
  end
end
