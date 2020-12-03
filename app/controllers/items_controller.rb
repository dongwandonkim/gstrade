class ItemsController < ApplicationController
  #before_action :authenticate_admin_user!
  #activeadmin
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, except: [:index]

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
  end

  def edit
  end

  def update
    if @item.update(params.require(:item).permit(:name, :description, :image_tag))
      flash[:notice] = "아이템 내용이 수정 되었습니다"
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end
end
