require 'open-uri'
require 'base64'

module ResumeTemplatingEngine
  class Manifest
    TEMPLATE_ROOT = "app/presenters/resume_templating_engine/templates".freeze

    def get
      manifest
    end

    private

    def manifest
      @manifest ||= YAML.load_file(
        Rails.root.join("#{TEMPLATE_ROOT}/manifest.yml")
      )
      set_images
    end

    def set_images
      @manifest.each do |key, template|
        template['thumbnail'] = thumbnail(key)
        template['preview'] = preview(key)
      end
      @manifest
    end

    def thumbnail(slug)
      path = Rails.root.join("#{TEMPLATE_ROOT}/#{slug}/thumbnail.jpg")
      path_to_asset_url(path, slug, 'thumbnail')
    end

    def preview(slug)
      path = Rails.root.join("#{TEMPLATE_ROOT}/#{slug}/preview.jpg")
      path_to_asset_url(path, slug, 'preview')
    end

    def path_to_asset_url(path, slug, type)
      File.exists?(path) ?
        ActionController::Base.helpers.asset_url("templates/#{slug}/#{type}.jpg") :
        ActionController::Base.helpers.asset_url("default-#{type}.jpg")
    end
  end
end
