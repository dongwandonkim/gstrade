class RegisteredItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @registered_items = RegisteredItem.all
  end
  def new
    @registered_item = RegisteredItem.new
    @inGameid = current_user.in_game_id
  
  end
  # item_id: 1, user_id: 8, server_id: 1, category_id: 1, quantity: 3, created_at: "2020-12-03 05:56:16", updated_at: "2020-12-03 05:56:16", price:
  def create
    @registered_item = RegisteredItem.new(params.require(:registered_item).permit(
                                          :item_id, :user_id, :server_id, 
                                          :category_id, :quantity, :price)
                                         )
    # @registered_item = current_user.registered_items.build(registered_items_params)
    @registered_item.user_id = current_user.id

    if @registered_item.save
      flash[:notice] = "등록되었습니다."
      redirect_to @registered_item
    else
      render 'new'
    end
  end

  def search
    
  end

  def show
    @registered_item = RegisteredItem.find(params[:id])
  end

  private
  def registered_items_params
    params.require(:registered_item).permit(:item_id, :user_id, :server_id, :category_id, :quantity, :price)
  end

end
