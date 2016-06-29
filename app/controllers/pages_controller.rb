class PagesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @slides = Slide.all
  end

  def collection category_id, product_type_id
    @products = Product.joins('INNER JOIN product_categories ON product.id = product_categories.product_id').where()
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
