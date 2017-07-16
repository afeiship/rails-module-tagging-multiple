class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(allowed_params)
    if @tag.save
      redirect_to @tag, notice: "Created tag."
    else
      render :new
    end
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(allowed_params)
      redirect_to @tag, notice: "Updated article."
    else
      render :edit
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to tag
  end


  private
  def allowed_params
    params.require(:tag).permit(:name)
  end
end
