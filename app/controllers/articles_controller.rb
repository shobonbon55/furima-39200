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
      params.require(:article).permit(:title,:text,:category_id )
      params.require(:article).permit(:title,:text,:condition_id  )
      params.require(:article).permit(:title,:text,:courier_fare_id  )
      params.require(:article).permit(:title,:text,:send_area_id  )
      params.require(:article).permit(:title,:text,:send_period_id  )
    end
  end  