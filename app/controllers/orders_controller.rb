class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @sales = Sale.new(sales_params)
    if @sales.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sales_params
    params.require(:sale).permit(:postal_code, :address, :house_number, :house_name, :telephone_number, :prefecture_id).merge(item_id: current_item.id)
  end

end
