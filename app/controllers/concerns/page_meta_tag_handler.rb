include ActionView::Helpers::AssetUrlHelper

module PageMetaTagHandler
  extend ActiveSupport::Concern

  included do
    before_action :set_default_tags
  end

  def set_default_tags
    @page_meta_tags = {
      site: 'Imprezify',
      separator:   " | ".html_safe
    }
  end

  def set_homepage_tags
    @page_meta_tags[:title] = 'Best free professional resume builder'
    @page_meta_tags[:description] = 'Creative and professional looking resume template for free.'
    @page_meta_tags[:keywords] = 'resume, resume builder, resume builder free, resume builder singapore, cv builder, cv builder free, free resume builder, free resume builder'
    @page_meta_tags[:canonical] = request.base_url
    @page_meta_tags[:image_src] = view_context.image_url('facebook-banner.jpg')
    @page_meta_tags[:og] = {
      url: request.base_url,
      title: 'Best free professional resume builder',
      description: 'Creative and professional looking resume template for free.',
      image: view_context.image_url('facebook-banner.jpg'),
    }
    @page_meta_tags[:fb] = { app_id: ENV['FB_APP_ID'] }
  end

  def set_dashboard_tags
    @page_meta_tags[:title] = 'Resume Dashboard'
    @page_meta_tags[:noindex] = true
  end

  def set_resume_edit_tags
    @page_meta_tags[:title] = 'Edit resume'
    @page_meta_tags[:noindex] = true
  end

  def no_index_tags
    @page_meta_tags[:noindex] = true
  end
end
