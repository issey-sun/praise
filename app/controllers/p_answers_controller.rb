class PAnswersController < ApplicationController
  def create
    @p_answer = PAnswer.new(p_answer_params)
    if @p_answer.save
      redirect_to "/p_definitions/#{@p_answer.p_definition.id}"
      else
        @p_definition = @p_answer.p_definition
        @p_answers = @p_definition.p_answers
        render "p_definitions/show"
      end
  end


  private
  def p_answer_params
    params.require(:p_answer).permit(:answer, :answer_day, :image, :user, :p_definition).merge(user_id: current_user.id, p_definition_id: params[:p_definition_id])
  end
end
