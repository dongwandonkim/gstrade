class RegisteredItemsController < ApplicationController
  def index
    @registered_items = RegisteredItem.all
  end
end
