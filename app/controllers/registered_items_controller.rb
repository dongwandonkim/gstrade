class RegisteredItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_registered_item, only: [:edit, :show]

  def index
    @pagy, @registered_items = pagy( User.find(params[:user_id]).registered_items.order('created_at DESC'), items: 8)

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: 'posts', formats: [:html]), pagination: view_context.pagy_nav(@pagy)}
      }
    end
  end

  def new
    @registered_item = RegisteredItem.new
  end
  
  def create
    @registered_item = RegisteredItem.new(registered_items_params)
    # @registered_item = current_user.registered_items.build(registered_items_params)
    @registered_item.user_id = current_user.id
    
    if @registered_item.save
      ActionCable.server.broadcast 'room_channel',
                                    registered_item: @registered_item,
                                    item_info: @registered_item.item,
                                    user_info: @registered_item.user,
                                    server_info: @registered_item.server.server_name
      flash[:notice] = "등록되었습니다."
      redirect_to @registered_item
    else
      flash[:alert] = "존재하지않는 아이템입니다"
      render 'new'
    end
  end

  def edit
  end

  def show
    
  end

  private
  def registered_items_params
    params.require(:registered_item).permit(:item_id, :user_id, :server_id, :buy_sell, :quantity, :price)
  end

  def set_registered_item
    @registered_item = RegisteredItem.find(params[:id])

  end
end
