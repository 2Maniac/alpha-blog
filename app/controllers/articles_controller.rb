class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash_success
      redirect_to @article
    else
      flash_failure
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash_success
      redirect_to @article
    else
      flash_failure
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def flash_success
    flash[:success] = "Article was created successfully."
  end

  def flash_failure
    flash[:fail] = "Article can't be created."
  end

end