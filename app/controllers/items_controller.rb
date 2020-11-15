class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
end

private
def prototype_params
  params.require(:item).permit(:name, :description, :category_id, :condition_id, :price, :state_id, :delivery_days_id, :fee_id, :image).merge(user_id: current_user.id)
end

end
