class User::PagesController < UserController
  def index
    @slides = Slide.all
  end

  def collections

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
