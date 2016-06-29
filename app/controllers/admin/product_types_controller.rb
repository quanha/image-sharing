class Admin::ProductTypesController < AdminController
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]

  def index
    @product_types = ProductType.all
  end

  def show
  end

  def new
    @product_type = ProductType.new
  end

  def edit
  end

  def create
    @product_type = ProductType.new(product_type_params)

    respond_to do |format|
      if @product_type.save
        flash[:success] = 'Product type was successfully created.'
        format.html { redirect_to admin_product_types_path }
      else
        flash[:danger] = @product_type.errors.full_messages
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_type.update(product_type_params)
        flash[:success] = 'Product type was successfully updated.'
        format.html { redirect_to admin_product_types_path }
      else
        flash[:danger] = @product_type.errors.full_messages
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product_type.destroy
    flash[:success] = 'Product type was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to admin_product_types_path }
    end
  end

  private
    def set_product_type
      @product_type = ProductType.find(params[:id])
    end

    def product_type_params
      params.require(:product_type).permit(:name, :description, :image )
    end
end
