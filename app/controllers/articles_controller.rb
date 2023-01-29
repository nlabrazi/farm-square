class ArticlesController < ApplicationController
  #before_action :is_admin?, except: :index

  def index
    @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 6)
  end

  def new
    @article = Article.new
  end

  def create
    @user = current_user
    @article = Article.new(article_params)
    if @article.save
      redirect_to blog_path, notice: "Article créé"
    else
      redirect_to blog_path, notice: "Error #{@article.errors.messages}"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.save
      redirect_to articles_path, notice: "Article mis à jour"
    else
      render :edit, notice: "ERREUR"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user.email
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :picture)
  end

end
