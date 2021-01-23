class DefinitionsController < ApplicationController
 before_action :authenticate_user!, only: [:show]
  def new
    @definition = Definition.new
  end

  def index
    @todays_date = Date.today
    @definitions = Definition.all
    @p_definitions = PDefinition.all
  end

  def create
    @definition = Definition.new(definition_params)
    if @definition.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @definition = Definition.find(params[:id])
    @review = Review.new
    @p_review = PReview.new
    @answer = Answer.new
    @answers = @definition.answers.includes(:user)
    @comment = Comment.new
    @comments = @definition.comments.includes(:user)
    @todays_date = Date.today
  end

  def edit
    @definition = Definition.find(params[:id])
  end

  def update
    @definition = Definition.find(params[:id])
    @definition.update(definition_params)
    redirect_to root_path
  end

  def destroy
    @definition = Definition.find(params[:id])
    if current_user == @definition.user
      @definition.destroy
      redirect_to root_path
    else
      render :show
    end
  end

 

  private
  def definition_params
    params.require(:definition).permit(:title, :body, :definition_day, :image, :user).merge(user_id: current_user.id)
  end

 
end
