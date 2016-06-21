class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        flash[:success] = "Category was successfully created."
        format.html { redirect_to admin_categories_path}
      else
        flash.now[:danger] = @category.errors.full_messages
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        flash[:success] = "Category was successfully updated."
        format.html { redirect_to admin_categories_path}
      else
        flash.now[:danger] = @category.errors.full_messages
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      flash[:success] = 'Category was successfully destroyed.'
      format.html { redirect_to admin_categories_path }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end
end
