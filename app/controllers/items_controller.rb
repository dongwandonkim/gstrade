class ItemsController < ApplicationController
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
end
