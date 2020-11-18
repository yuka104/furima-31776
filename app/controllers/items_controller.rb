class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
end

private
def item_params
  params.require(:item).permit(:name, :description, :category_id, :condition_id, :price, :state_id, :delivery_days_id, :fee_id, :image).merge(user_id: current_user.id)
end

end
