class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def purchase_params
    params.require(:purchase).permit(:number, :exp_month, exp_year, :cvc, :postal_code, :state_id, :city, :block_number, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end