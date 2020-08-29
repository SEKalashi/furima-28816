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
    params.require(:item).permit(:name, :description, :status, :shipping_time, :delivery_charge, :category, :sending_area, :price, :image)
  end
end
