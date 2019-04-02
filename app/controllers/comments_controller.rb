class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_ownership, only: :destroy

  def create
    @comment = current_user.comments.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article = @article

    if @comment.save
      flash[:succes] = 'Comment created successfully'
    else
      if @comment.errors.any?
        @comment.errors.full_messages.each do |msg|
          flash[:danger] = msg
        end
      end
    end

    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def require_ownership
    if current_user != Comment.find(params[:id]).user
      flash[:danger] = 'Comment permission denied'
      redirect_to root_path
    end
  end
end
