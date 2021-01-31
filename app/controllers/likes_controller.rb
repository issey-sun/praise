class LikesController < ApplicationController
  
  def create
    @like = current_user.likes.create(answer_id: params[:answer_id])
    redirect_back(fallback_location: root_path)
    @user = current_user
    @answer = Answer.find(params[:answer_id])
    current_user.likes.find_by(answer_id: @answer.id)
    #通知機能追加
    @answer.create_notification_like!(current_user)
    # respond_to do |format|
    #   format.html { redirect_back(fallback_location: root_url) }
    #   format.js
    # end
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @like = current_user.likes.find_by(answer_id: @answer.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end


end
