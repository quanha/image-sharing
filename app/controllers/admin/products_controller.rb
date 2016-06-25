class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @product.product_quantities.build
  end

  def edit
    @product.product_quantities.build
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        if params[:images]
          params[:images].each { |image|
            @product.pictures.create(image: image)
          }
        end
        flash[:success] = "Product was successfully created."
        format.html { redirect_to admin_products_path }
      else
        flash.now[:danger] = @product.errors.full_messages
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        if params[:images]
          params[:images].each { |image|
            @product.pictures.create(image: image)
          }
        end
        flash[:success] = "Product was successfully updated."
        format.html { redirect_to admin_products_path }
      else
        flash.now[:danger] = @product.errors.full_messages
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      flash[:success] = "Product was successfully destroyed."
      format.html { redirect_to admin_products_path }
    end
  end

  def delete_image
    Picture.find(params[:id]).destroy
    render json: {status: true}
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :detail, :supplier_id, :image, :price, :sale_price,
                                      :code, product_quantities_attributes: [:id ,:size, :quantity, :store_id, :_destroy], category_ids: [] )
    end
end
