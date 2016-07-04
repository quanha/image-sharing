class PagesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @slides = Slide.all
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

  def accessories

  end

  def about_us

  end

  def contact

  end
end
