class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
      # @item = Item.find(params[:id])
  end

  def create
  end
  
  
end
