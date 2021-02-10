class DefinitionsController < ApplicationController
 before_action :authenticate_user!, only: [:show]
 before_action :blocking_edit_definition, only: %i[edit update destroy]

  def new
    @definition = Definition.new
  end

  def index
    @definitions = Definition.all.page(params[:page])
    @p_definitions = PDefinition.all.page(params[:page])
  end

  def create
    @definition = Definition.new(definition_params)
    if @definition.save
      redirect_to root_path(anchor:"ethics")
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
    @rank = Answer.find(Like.where(definition_id: params[:id]).group(:answer_id).order('count(answer_id) desc').limit(1).pluck(:answer_id))
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

  def blocking_edit_definition
    redirect_to root_path, alert: "不正な操作です" unless (@definition.user == current_user) || current_user.admin?
  end

 
end
