class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @items = User.all
  end

  def new
    @items = User.new
  end

  def create
    @items = User.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def items_params
    params.require(:user).merge(image: image.id)
    # .permit(:name, :description, :status_id, :shipping_time_id, :delivery_charge_id, :category_id, :sending_area_id, :price)
    # .merge(user_id: current_user.id).merge(image_id: current_image.id)
  end
end
