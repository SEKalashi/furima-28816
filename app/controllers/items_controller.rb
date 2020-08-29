class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @items = Item.all
  end

  def new
    @items = ItemImage.new
  end

  def create
    @items = ItemImage.new(items_params)
    if @items.valid?
      @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item_image).permit(:item_id, :name, :description, :status_id, :shipping_time_id, :delivery_charge_id, :category_id, :sending_area_id, :price, :image)
  end
end
