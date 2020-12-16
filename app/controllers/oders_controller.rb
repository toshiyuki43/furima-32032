class OdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def edit
  end

  def index
    @order = OrderShippingAddress.new
    redirect_to root_path if current_user.id == @product.user.id or @product.order.presence
  end
  
end
