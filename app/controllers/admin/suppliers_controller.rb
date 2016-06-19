class Admin::SuppliersController < AdminController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  def index
    @suppliers = Supplier.all
  end

  def show
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end

  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        flash[:success] = "Supplier was successfully created."
        format.html { redirect_to admin_suppliers_path }
      else
        flash.now[:danger] = @supplier.errors.full_messages
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        flash[:success] = "Supplier was successfully updated."
        format.html { redirect_to admin_supplier_path(@supplier) }
      else
        flash[:danger] = @supplier.errors.full_messages
        format.html { render :edit }
      end
    end
  end

  def destroy
    @supplier.destroy
    respond_to do |format|
      flash[:success] = "Supplier was successfully destroyed."
      format.html { redirect_to admin_suppliers_path }
    end
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:name, :description)
    end
end
