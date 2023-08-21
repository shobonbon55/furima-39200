  class ArticlesController < ApplicationController
    def index
      @articles = Article.order("created_at DESC")
    end
  
    def new
      @article = Article.new
    end
  
    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to root_path
      else
        render :new
      end
    end
  
    private
  
    def article_params
      params.require(:article).permit(:title,:text,:category_id,:condition_id,:courier_fare_id,:send_area_id,:send_period_id )
    end
  end  