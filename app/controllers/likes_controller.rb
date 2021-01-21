class LikesController < ApplicationController
  
  def create
    @like = current_user.likes.create!(answer_id: params[:answer_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @like = current_user.likes.find_by(answer_id: @answer.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
    
end
