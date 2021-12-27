class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :destroy, :edit, :update]
  
  def new  
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Your Article has been created!"
    redirect_to article_path(@article)
  end

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' was updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy 

    flash.notice = "The Article has been deleted!"

    redirect_to articles_path
  end

  private

  def article_params
    params.permit(:title, :body)    
  end

  def set_article
    @article = Article.find(params[:id])    
  end
end 