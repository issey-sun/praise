class UsersController < ApplicationController
   
  def show
    @user = User.find(params[:id])
    @sex = Sex.find(params[:id])
    @definitions =  @user.definitions
    
    @birth_day = @user.birth_day.year
    @todays_date = Date.today.year

    @age = @todays_date - @birth_day
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end


