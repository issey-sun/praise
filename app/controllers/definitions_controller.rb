class DefinitionsController < ApplicationController
 before_action :authenticate_user!, only: [:show]

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
    @rank = Answer.find(Like.where(definition_id: params[:id]).group(:answer_id).order('count(answer_id) desc').limit(1).pluck(:answer_id))
  end

  def edit
    @definition = Definition.find(params[:id])
  end

  def update
    @definition = Definition.find(params[:id])
    @definition.update(definition_params)
    redirect_to root_path(anchor:"ethics")
  end

  def destroy
    @definition = Definition.find(params[:id])
    if current_user == @definition.user
      @definition.destroy
      redirect_to root_path(anchor:"ethics")
    else
      render :show
    end
  end

  def new_guest
    user = User.find_or_create_by!(nickname:'guest', email: 'guest@example.com', occupation: 'guest', position: 'guest', birth_day: '1990-10-10', sex_id: 2) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.image.attach(io: File.open(Rails.root.join("app/assets/images/homekatajiten.png")), filename: "homekatajiten.png")
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
 

  private
  def definition_params
    params.require(:definition).permit(:title, :body, :definition_day, :image, :user).merge(user_id: current_user.id)
  end
 
end
