class ItemsController < ApplicationController
  #before_action :authenticate_admin_user!
  #activeadmin
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  #TODO : need to set admin authentication
  def create
    @item = Item.new(params.require(:item).permit(:name, :description, :image_tag))
    if @item.save
      flash[:notice] = "아이템이 등록되었습니다"
      redirect_to items_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params.require(:item).permit(:name, :description, :image_tag))
      flash[:notice] = "아이템 내용이 수정 되었습니다"
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end
end
