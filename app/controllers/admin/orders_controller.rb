class Admin::OrdersController < AdminController
  before_action :set_store, only: [:show, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def destroy
    @order.destroy
    respond_to do |format|
      flash[:success] = 'Order was successfully destroyed.'
      format.html { redirect_to admin_orders_path }
    end
  end

  private
  def set_store
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :address, :working_time)
  end
end
