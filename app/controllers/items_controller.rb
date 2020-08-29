class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @items = UserItems.all
  end

  def new
    @items = UserItems.new
  end

  def create
    @items = UserItems.new(items_params)
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
    params.require(:user_items).permit(:nickname, :first_name, :first_kana, :family_name, :family_kana, :birthday, :email, :password,:name, :description, :status_id, :shipping_time_id, :delivery_charge_id, :category_id, :sending_area_id, :price, :image)
    # .merge(user_id: current_user.id).merge(image_id: current_image.id)
  end
end
