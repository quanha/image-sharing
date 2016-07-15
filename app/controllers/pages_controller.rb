class PagesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_menu

  def index
    @slides = Slide.all
    @featured_categories = Category.where(at_homepage: true).limit(2)
  end

  def collections
    product_type_query = (params[:product_type_id].to_i != 0) ? "products.product_type_id = #{params[:product_type_id]}" : nil
    @category = Category.find(params[:category_id])
    @products = Product.joins(:product_categories).where(product_categories: {category_id: params[:category_id]}).where(product_type_query)
    @product_types = ProductType.joins(products: :product_categories).where(product_categories: {category_id: params[:category_id]})
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
    @order = Order.new

  end

  def checkout

  end

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
      cart[product_quantity.id.to_s] = ['product' => product_quantity.product, 'size' => params[:size], 'image' => product_quantity.product.image.url(:thumb)]
      message = "You have added #{product_quantity.product.name} size #{params[:size]} to your cart"
    end
    session[:cart] = cart
    render json: {message: message}
  end

  private
  def set_menu
    @nav_menus = Menu.order(:display_order)
  end

  def order_params
    params.require(:order).permit(:name, :description, :detail, :supplier_id, :image, :price, :sale_price, :product_type_id,
                                    :code, product_quantities_attributes: [:id ,:size, :quantity, :store_id, :_destroy], category_ids: [] )
  end
end
