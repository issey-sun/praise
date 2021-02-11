class PLikesController < ApplicationController
  def create
    @p_like = current_user.p_likes.create(p_answer_id: params[:p_answer_id], p_definition_id: params[:p_definition_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @p_answer = PAnswer.find(params[:p_answer_id])
    @p_like = current_user.p_likes.find_by(p_answer_id: @p_answer.id)
    @p_like.destroy
    redirect_back(fallback_location: root_path)
  end
end
