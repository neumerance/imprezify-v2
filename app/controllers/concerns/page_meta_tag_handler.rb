module PageMetaTagHandler
  extend ActiveSupport::Concern

  included do
    before_action :set_default_tags
  end

  def set_default_tags
    @page_meta_tags = {
      site: 'Imprezify',
      separator:   "&mdash;".html_safe
    }
  end

  def set_homepage_tags
    @page_meta_tags[:title] = 'Best free professional resume builder'
    @page_meta_tags[:description] = 'Build your own professional looking resume absolutely FREE.'
    @page_meta_tags[:keywords] = 'resume, free resume, professional resume, resume template, cv, free cv'
    @page_meta_tags[:canonical] = request.base_url
  end

  def set_dashboard_tags
    @page_meta_tags[:title] = 'Resume Dashboard'
    @page_meta_tags[:noindex] = true
  end

  def set_resume_edit_tags
    @page_meta_tags[:title] = 'Edit resume'
    @page_meta_tags[:noindex] = true
  end
end
