class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
    # binding.pry
  end

  def create
    @items = Item.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :status_id, :shipping_time_id, :delivery_charge_id, :category_id, :sending_area_id, :price, :image).merge(user_id: current_user.id)
  end
end
