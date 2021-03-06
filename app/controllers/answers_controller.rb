class AnswersController < ApplicationController


  def create
    @definition = Definition.find(params[:definition_id])
    @answer = Answer.new(answer_params)
    @answer = @definition.answers.new(answer_params)

    
    if @answer.save
      redirect_to "/definitions/#{@answer.definition.id}"
      @definition.create_notification_answer!(current_user, @answer.id)
      else
        @definition = @answer.definition
        @answers = @definition.answers
        render "definitions/show"
      end
      # gets_all_answers
  end

  private
  def answer_params
    params.require(:answer).permit(:answer, :user, :definition).merge(user_id: current_user.id, definition_id: params[:definition_id])
  end
end

