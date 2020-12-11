class PageController < ApplicationController
  def home
    @buy_items = RegisteredItem.where("buy_sell = ?", true)
    @sell_items = RegisteredItem.where("buy_sell = ?", false)
  end
end
