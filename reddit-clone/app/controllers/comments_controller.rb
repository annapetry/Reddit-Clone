class CommentsController < ApplicationController
  def new
   @comment = Comment.new(post_id: params[:post_id], parent_comment_id: params[:parent_comment_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to new_post_comments_url(@comment.post)
    end
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    @new_comment = Comment.new(
      post_id: @comment.post_id, parent_comment_id: @comment.id
    )
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end
