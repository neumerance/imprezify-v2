module LandingNavigationMenuHandler
  extend ActiveSupport::Concern

  included do
    before_action :set_default_menus
  end

  def set_home_navigation
    @menus << { name: 'My Resume', url: resume_index_path } if user_signed_in?
    @menus << { name: 'Templates', url: '#section-templates' }
    @menus << { name: 'Reviews', url: '#section-reviews' }
    @menus << { name: 'FAQ', url: '#section-faq' }
  end

  def set_default_menus
    @menus = [
      {
        name: 'Home',
        url: root_path
      }
    ]
  end
end
