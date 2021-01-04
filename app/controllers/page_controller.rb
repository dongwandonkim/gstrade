class PageController < ApplicationController
  def home
    @pagy, @items = pagy(RegisteredItem.order('created_at DESC'), items: 8)

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: 'posts', formats: [:html]), 
                        pagination: view_context.pagy_nav(@pagy)}
      }
    end
  end
end
