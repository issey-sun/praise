class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[destroy edit update]

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @definitions =  @user.definitions
    
    @birth_day = @user.birth_day.year
    @todays_date = Date.today.year

    @age = @todays_date - @birth_day
  end

  def edit; end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
      if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render "/devise/registrations/edit"
    end
  end


  def destroy
    @definition.destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'アカウントが無事削除されました！' }
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :occupation, :position, :birth_day, :sex_id, :image)
  end

end


