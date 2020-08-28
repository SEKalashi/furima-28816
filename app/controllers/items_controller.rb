class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]


  def index
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.create(items_params)
  end

  def destroy
  end

  private

  def items_params
    params.require(:user).permit(:name)
  end

end
