class PAnswersController < ApplicationController
  # def create
  #   @p_answer = PAnswer.new(p_answer_params)
  #   if @p_answer.save
  #     redirect_to "/p_definitions/#{@p_answer.p_definition.id}"
  #     else
  #       @p_definition = @p_answer.p_definition
  #       @p_answers = @p_definition.p_answers
  #       render "p_definitions/show"
  #     end
  # end

  def create
    @p_definition = PDefinition.find(params[:p_definition_id])
    @p_answer = PAnswer.new(p_answer_params)
    @p_answer = @p_definition.p_answers.new(p_answer_params)

    
    if @p_answer.save
      redirect_to "/p_definitions/#{@p_answer.p_definition.id}"
      @p_definition.create_notification_p_answer!(current_user, @p_answer.id)
      else
        @p_definition = @p_answer.p_definition
        @p_answers = @p_definition.p_answers
        render "p_definitions/show"
      end
      # gets_all_p_answers
  end


  private
  def p_answer_params
    params.require(:p_answer).permit(:answer, :user, :p_definition).merge(user_id: current_user.id, p_definition_id: params[:p_definition_id])
  end
end
