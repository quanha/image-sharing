class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :authenticate_admin, :set_menu

  def dashboard

  end

  private

  def authenticate_admin
    redirect_to '/' if !user_signed_in? || current_user.role.user?
  end

  def set_menu
    parents = BackendMenu.where('parent_id IS NULL OR parent_id = ?', 0).order(:display_order)
    menus = generate_menu(parents)
    parents.each do |parent|
      children = BackendMenu.where(parent_id: parent.id).order(:display_order)
      if children.count > 0
        menus[parent.name]['children'] = generate_menu(children)
      end
    end
    @left_menus = menus
  end

  def generate_menu(menu_input)
    menu_output = Hash.new
    menu_input.each do |menu|
      menu_output[menu.name] = Hash[
          'icon' => menu.icon,
          'url' => menu.url,
          'highlight' => menu.highlight
      ]
    end
    menu_output
  end

end
