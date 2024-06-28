class OrdersController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @product = Product.find(params[:product_id])
      @order = current_user.buyer.orders.build(order_params.merge(product: @product))
  
      if @order.save
        redirect_to @product, notice: 'Order was successfully created.'
      else
        redirect_to @product, alert: 'Order could not be created.'
      end
    end
  
    private
    def order_params
      params.require(:order).permit(:quantity)
    end
  end
  