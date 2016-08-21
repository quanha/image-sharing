class PagesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_menu

  def index
    @slides = Slide.all
    @featured_categories = Category.where(at_homepage: true).limit(2)
    @featured_product_types = ProductType.where(homepage: true).where.not(collection_homepage: nil)
  end

  def collections
    product_type_query = (params[:product_type_id].to_i != 0) ? "products.product_type_id = #{params[:product_type_id]}" : nil
    @category = Category.find(params[:category_id])
    @products = Product.joins(:product_categories).where(product_categories: {category_id: params[:category_id]}).where(product_type_query)
    @product_types = ProductType.joins(products: :product_categories).where(product_categories: {category_id: params[:category_id]}).group([:id, :name])
  end

  def new_arrivals

  end

  def sales

  end

  def product
    @product = Product.find(params[:id])
  end

  def about_us

  end

  def cart
    temp_product = Product.all
    hsh = Hash.new
    temp_product.each do |item|
      hsh[item.id] = item
    end
    @products = hsh
  end

  def checkout
    temp_product = Product.all
    hsh = Hash.new
    temp_product.each do |item|
      hsh[item.id] = item
    end
    @products = hsh

    @order = Order.new
    if session[:cart].blank?
      flash[:danger] = 'You do not have any thing in cart.'
      redirect_to cart_path
    end
  end

  def save_order
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        session[:cart].each_with_index do  |(key,item), index|
          OrderProduct.new(product_id: item['product_id'].to_i, size: item['size'].to_i, quantity: item['quantity'].to_i, order_id: @order.id).save!
          ProductQuantity.subtract_quantity(item['product_id'].to_i, item['size'].to_i, item['quantity'].to_i)
        end
        session[:cart] = nil
        flash[:success] = ' We will deliver your ordered product(s) to you soon. Thank you for your support.'
        format.html { redirect_to order_success_path }
      else
        flash.now[:danger] = @order.errors.full_messages
        format.html { render checkout_path }
      end
    end
  end

  def order_success

  end

  # ajax-cart

  def get_store_quantity
    quantities = ProductQuantity.joins(:store).where(product_quantities: {product_id: params[:product_id], size: params[:size]})
    html = render_to_string(partial: 'pages/quantity_row', locals: { product_quantity: quantities})
    render json: {raw_html: html}
  end

  def add_to_cart
    cart = session[:cart].present? ? session[:cart] : Hash.new
    product_quantity = ProductQuantity.where('product_id' => params[:product_id], 'size' => params[:size]).take!
    if cart.has_key? product_quantity.id.to_s
      message = "#{product_quantity.product.name} size #{params[:size]} is already in your cart"
    else
      cart[product_quantity.id.to_s] = Hash['product_id' => product_quantity.product.id, 'size' => params[:size], 'quantity' => '1']
      message = "You have added #{product_quantity.product.name} size #{params[:size]} to your cart"
    end
    session[:cart] = cart
    render json: {message: message}
  end

  def remove_product
    status = false
    if session[:cart].delete(params[:id].to_s)
      status = true
    end
    render json: {status: status}
  end

  def select_quantity
    cart_product = session[:cart][params[:id].to_s]
    current_quantity = ProductQuantity.get_quantity(cart_product['product_id'].to_i, cart_product['size'].to_i)
    product = Product.find(cart_product['product_id'].to_i)
    if current_quantity < params[:quantity].to_i
      session[:cart][params[:id].to_s]['quantity'] = current_quantity
      flash[:danger] = "#{product.name} size #{cart_product['size']} only has #{current_quantity} product(s). Please contact the shop manager to order more."
    else
      session[:cart][params[:id].to_s]['quantity'] = params[:quantity]
    end
    render json: {status: true}
  end

  private
  def set_menu
    @nav_menus = Menu.order(:display_order)
  end

  def order_params
    params[:order][:user_id] = current_user.id if current_user.present?
    params.require(:order).permit(:name, :email, :phone, :address, :note, :user_id)
  end
end
