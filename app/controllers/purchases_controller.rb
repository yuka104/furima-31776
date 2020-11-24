class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  

  def index
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def purchase_params
    params.require(:purchase_address).permit(:purchase_id, :postal_code, :state_id, :city, :block_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  
        card: @purchase_address.token,   
        currency: 'jpy'                
      )
  end

  def move_to_index
    if @item.purchase != nil || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end