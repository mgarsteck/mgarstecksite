class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def new
    @pic = Pic.new
  end

  def show

  end

  def create
    @pic = Pic.new(pic_params)

    if @pic.save
      flash[:success] = "The picture was posted properly"
      redirect_to pic_path(@pic)
    else
      redirect_to :new
    end
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      flash[:success] = "Picture updated successfully"
      redirect_to @pic
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to pics_path
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end
end