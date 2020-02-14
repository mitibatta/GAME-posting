class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
  end
  
  
  def create
    @comment = current_user.comments.new(comment_params)
    # @comment.user_id = current_user.id
    # @comment.post_id = params[:post_id]
    
    if @comment.save
      redirect_to post_path(@comment.post_id), success:"コメントを投稿しました。"
    else
      flash.now[:danger] = "コメントに失敗しました。"
      render :new
    end
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
  
end
