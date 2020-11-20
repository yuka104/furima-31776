class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end
  
  def create
    @purchase = PurchaseAddress.new(purchase_params)
  end
  
  private
  def purchase_params
    params.require(:purchase).permit(:authenticity_token, :purchase, :postal_code, :state_id, :city, :block_number, :building, :phone_number)
 
  end

  end