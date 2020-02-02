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
      path_to_base64_url(path, 300, 421)
    end

    def preview(slug)
      path = Rails.root.join("#{TEMPLATE_ROOT}/#{slug}/preview.png")
      path_to_base64_url(path, 595, 842)
    end

    def path_to_base64_url(path, x, y)
      encoded_image = File.exists?(path) ?
        Base64.encode64(File.read(path)) :
        url_to_base64("https://picsum.photos/#{x}/#{y}")
      "data:image/png;base64,#{encoded_image}"
    end

    def url_to_base64(url)
      url = URI.parse(url)
      Base64.encode64(open(url).read)
    end
  end
end
