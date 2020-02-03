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
      path = Rails.root.join("#{TEMPLATE_ROOT}/#{slug}/thumbnail.png")
      path_to_base64_url(path, 'thumbnail')
    end

    def preview(slug)
      path = Rails.root.join("#{TEMPLATE_ROOT}/#{slug}/preview.png")
      path_to_base64_url(path, 'preview')
    end

    def path_to_base64_url(path, type)
      path = File.exists?(path) ?
        path : Rails.root.join(
          "app/presenters/resume_templating_engine/default-#{type}.jpg"
        )
      encoded_image = Base64.encode64(File.read(path))
      "data:image/png;base64,#{encoded_image}"
    end
  end
end
