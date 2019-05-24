class ArticlesController < ApplicationController
    # user auth
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    # show all articles
    def index
        @articles = Article.all
    end
    # show article
    def show
        @article = Article.find(params[:id])
    end
    # show form for create new article
    def new
        @article = Article.new
    end
    # edit article
    def edit
        @article = Article.find(params[:id])
    end
    # create new article
    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    # update article
    def update
        @article = Article.find(params[:id])
      
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end
    # remove article
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
      
        redirect_to articles_path
    end
    # white list for articles
    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
