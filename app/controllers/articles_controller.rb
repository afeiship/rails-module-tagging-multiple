class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(allowed_params)
    if @article.save
      redirect_to @article, notice: "Created article."
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(allowed_params)
      redirect_to @article, notice: "Updated article."
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  private
  def allowed_params
    params.require(:article).permit(:content, :name, :tag_list)
  end
end