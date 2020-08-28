class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]


  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(items_params)
  end

  def destroy
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :status, :shipping_time, :delivery_charge, :category, :sending_area, :price).merge(user_id: current_user.id).merge(image_id: current_image.id)
  end

end
