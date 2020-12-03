class RegisteredItemsController < ApplicationController

  def index
    @registered_items = RegisteredItem.all
  end
  def new
    @registered_item = RegisteredItem.new
  end
  # item_id: 1, user_id: 8, server_id: 1, category_id: 1, quantity: 3, created_at: "2020-12-03 05:56:16", updated_at: "2020-12-03 05:56:16", price:
  def create
    @registered_item = RegisteredItem.new(params.require(:registered_item).permit(
                                          :item_id, :user_id, :server_id, 
                                          :category_id, :quantity, :price)
                                         )
    @registered_item.user.user_id = current_user
    if @registered_item.save
      flash[:notice] = "등록되었습니다."
      redirect_to @registered_item
    else
      render 'new'
    end

  end
end
