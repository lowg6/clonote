class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to "#{note_path(@comment.note)}#comment"
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :note_id, :user_id)
  end
end
