class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_order, only: [:index, :create]
  before_action :sale_errors, only: [:index]

  def index
  end

  def create
    if @sale.valid?
      pay_item
      @sale.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sales_params
    params.permit(:order_sale, :postal_code, :address, :house_number, :house_name, :telephone_number, :prefecture_id, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: sales_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
    @sale = OrderSale.new(sales_params)
  end

  def sale_errors
    redirect_to root_path if @item.user.id == current_user.id
  end
end
