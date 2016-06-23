class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        flash[:success] = 'Page was successfully created.'
        format.html { redirect_to admin_pages_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        flash[:success] = 'Page was successfully updated.'
        format.html { redirect_to admin_pages_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      flash[:success] = 'Page was successfully destroyed.'
      format.html { redirect_to admin_pages_path }
    end
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:name, :content)
    end
end
