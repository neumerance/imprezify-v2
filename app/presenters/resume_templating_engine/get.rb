module ResumeTemplatingEngine
  class Get
    TEMPLATE_ROOT = "app/presenters/resume_templating_engine/templates".freeze

    def initialize(slug)
      @slug = slug
    end

    def render_as_string(bindings)
      ERB.new(template_string).result(binding)
    end

    def meta_data
      manifest = YAML.load_file(
        "#{TEMPLATE_ROOT}/manifest.yml"
      ).symbolize_keys
      manifest[@slug]
    end

    private

    def template_string
      File.read(Rails.root.join(template_path))
    end

    def template_path
      "#{TEMPLATE_ROOT}/#{@slug}/index.html.erb"
    end
  end
end
