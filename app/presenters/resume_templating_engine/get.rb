module ResumeTemplatingEngine
  class Get
    TEMPLATE_ROOT = "app/presenters/resume_templating_engine/templates".freeze

    def initialize(resume)
      @resume = resume
    end

    def render_as_string
      data = ResumeSerializer.new(@resume).serializable_hash[:data]
      ERB.new(template_string).result(binding)
    end

    private

    def template_string
      File.read(Rails.root.join(template_path))
    end

    def template_path
      Rails.root.join("#{TEMPLATE_ROOT}/#{@resume.template_name}/index.html.erb")
    end
  end
end
