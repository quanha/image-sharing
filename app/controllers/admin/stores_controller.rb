class Admin::StoresController < AdminController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def show
  end

  def new
    @store = Store.new
  end

  def edit
  end

  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        flash[:success] = 'Store was successfully created.'
        format.html { redirect_to admin_stores_path }
      else
        flash.now[:danger] = @store.errors.full_messages
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @store.update(store_params)
        flash[:success] = 'Store was successfully updated.'
        format.html { redirect_to admin_stores_path }
      else
        flash.now[:danger] = @store.errors.full_messages
        format.html { render :edit }
      end
    end
  end

  def destroy
    @store.destroy
    respond_to do |format|
      flash[:success] = 'Store was successfully destroyed.'
      format.html { redirect_to admin_stores_path }
    end
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :address, :working_time)
    end
end
