class Admin::MenusController < AdminController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.all
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        flash[:success] = 'Menu was successfully created.'
        format.html { redirect_to @menu }
      else
        flash.now[:danger] = @menu.errors.full_messages
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        flash[:success] = 'Menu was successfully updated.'
        format.html { redirect_to @menu }
      else
        flash.now[:danger] = @menu.errors.full_messages
        format.html { render :edit }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      flash[:success] = 'Menu was successfully destroyed.'
      format.html { redirect_to menus_url }
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, :url_code, :display_order)
    end
end
