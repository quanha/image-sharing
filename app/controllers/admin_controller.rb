class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :authenticate_admin, :set_menu

  private

  def authenticate_admin
    redirect_to '/' if !user_signed_in? || current_user.role.user?
  end

  def set_menu
    parents = BackendMenu.where('parent_id IS NULL OR parent_id = ?', 0)
    menus = generate_menu(parents)
    menus.each do |menu|
      children = BackendMenu.where(parent_id: menu['id'])
      if children.count > 0
        menu += ['children' => generate_menu(children)]
        byebug
      end
    end
    menus
  end

  def generate_menu(menu_input)
    menu_output = Array.new
    menu_input.each do |menu|
      menu_output += [
          'id' => menu.id,
          'name' => menu.name,
          'icon' => menu.icon,
          'url' => menu.url,
          'highlight' => menu.highlight
      ]
    end
    menu_output
  end

end
