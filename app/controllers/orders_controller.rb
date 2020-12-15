class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer = current_user
    @order.fixed = false
    if @order.save
      flash[:notice] = 'Good Job'
      redirect_to orders_path
    else
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(:date, :customer, :address, :fixed)
  end
end
