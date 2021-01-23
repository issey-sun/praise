class PDefinitionsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def new
    @p_definition = PDefinition.new
  end

  def index
    @todays_date = Date.today
    @definitions = Definition.all
    @p_definitions = PDefinition.all
  end

  def create
    @p_definition = PDefinition.new(p_definition_params)
    if @p_definition.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @p_definition = PDefinition.find(params[:id])
    @p_review = PReview.new
    @review = Review.new
    @p_answer = PAnswer.new
    @p_answers = @p_definition.p_answers.includes(:user)
    @comment = Comment.new
    @comments = @p_definition.comments.includes(:user)
    @todays_date = Date.today
  end

  def edit
    @p_definition = PDefinition.find(params[:id])
  end

  def update
    @p_definition = PDefinition.find(params[:id])
    @p_definition.update(p_definition_params)
    redirect_to root_path
  end

  def destroy
    @p_definition = PDefinition.find(params[:id])
    if current_user == @p_definition.user
      @p_definition.destroy
      redirect_to root_path
    else
      render :show
    end
  end

 

  private
  def p_definition_params
    params.require(:p_definition).permit(:title, :body, :definition_day, :image, :user).merge(user_id: current_user.id)
  end

end
