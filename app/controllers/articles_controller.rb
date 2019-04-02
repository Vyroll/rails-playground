class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_ownership, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article
    else
      if @article.errors.any?
        @article.errors.full_messages.each do |msg|
          flash.now[:danger] = msg
        end
      end
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def require_ownership
    if current_user != Article.find(params[:id]).user
      flash[:danger] = 'Article permission denied'
      redirect_to root_path
    end
  end
end
