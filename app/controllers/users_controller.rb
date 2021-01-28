class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[destroy edit]

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @sex = Sex.find(params[:id])
    @definitions =  @user.definitions
    
    @birth_day = @user.birth_day.year
    @todays_date = Date.today.year

    @age = @todays_date - @birth_day
  end

  def edit; end

  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'アカウントが無事削除されました！' }
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end


