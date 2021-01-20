class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/definitions/#{@comment.definition.id}"
      else
        @definition = @comment.definition
        @comments = @definition.comments
        render "definitions/show"
      end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment,:user, :definition, :answer).merge(user_id: current_user.id, definition_id: params[:definition_id], answer_id: params[:answer_id])
  end

end


