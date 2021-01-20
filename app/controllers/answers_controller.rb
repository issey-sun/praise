class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to "/definitions/#{@answer.definition.id}"
      else
        @definition = @answer.definition
        @answers = @definition.answers
        render "definitions/show"
      end
  end


  private
  def answer_params
    params.require(:answer).permit(:answer, :answer_day, :image, :user, :definition).merge(user_id: current_user.id, definition_id: params[:definition_id])
  end
end

