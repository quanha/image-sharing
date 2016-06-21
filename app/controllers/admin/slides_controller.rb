class Admin::SlidesController < AdminController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]


  def index
    @slides = Slide.all
  end

  def show
  end

  def new
    @slide = Slide.new
  end

  def edit
  end

  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        flash[:success] = 'Slide was successfully created.'
        format.html { redirect_to admin_slides_path}
      else
        flash.now[:danger] = @slide.errors.full_messages
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    respond_to do |format|
      if @slide.update(slide_params)
        flash[:success] = 'Slide was successfully updated.'
        format.html { redirect_to admin_slides_path }
      else
        flash.now[:danger] = @slide.errors.full_messages
        format.html { render :edit }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      flash[:success] = 'Slide was successfully destroyed.'
      format.html { redirect_to admin_slides_path}
    end
  end

  private
    def set_slide
      @slide = Slide.find(params[:id])
    end

    def slide_params
      params.require(:slide).permit(:name, :description, :image)
    end
end
