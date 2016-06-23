class Admin::BackendMenusController < AdminController
  before_action :set_backend_menu, only: [:edit, :update, :destroy]

  def index
    @backend_menus = BackendMenu.all
  end

  def new
    @backend_menu = BackendMenu.new
  end

  def edit
  end

  def create
    @backend_menu = BackendMenu.new(backend_menu_params)
    respond_to do |format|
      if @backend_menu.save
        flash[:success] = 'Backend menu was successfully created.';
        format.html { redirect_to admin_backend_menus_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @backend_menu.update(backend_menu_params)
        flash[:success] = 'Backend menu was successfully updated.'
        format.html { redirect_to admin_backend_menus_path  }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @backend_menu.destroy
    respond_to do |format|
      flash[:success] = 'Backend menu was successfully destroyed.'
      format.html { redirect_to admin_backend_menus_path }
    end
  end

  def ajax_update_position
    respond_to do |format|
      format.json{ render :status => true}
    end
  end

  private
    def set_backend_menu
      @backend_menu = BackendMenu.find(params[:id])
    end

    def backend_menu_params
      params.require(:backend_menu).permit(:parent_id, :name, :icon, :highlight, :url, :display_order)
    end
end
