class ResponseToPdf
  def self.generate(content:)
    tmp = "tmp/resume-#{content.object_id}.pdf"
    File.open(tmp, 'w') do |file|
      file.binmode
      file.write(content)
    end
    tmp
  end
end
