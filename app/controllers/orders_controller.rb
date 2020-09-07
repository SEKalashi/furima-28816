class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @sale = OrderSale.new(sale_params)
    if @sale.valid?
      pay_item
      @sale.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def sales_params
    params.require(:order_sale).permit(:postal_code, :address, :house_number, :house_name, :telephone_number, :prefecture_id, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: sale_params,
      card: sale_params[:token],
      currency:'jpy'
    )
  end

end
