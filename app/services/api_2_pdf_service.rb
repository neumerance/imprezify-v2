class Api2PdfService
  include HTTParty
  base_uri ENV['API_2_PDF_URL']

  def self.generate_pdf_data(url)
    get(
      '/chrome/url', {
        query: {
          url: url,
          apikey: ENV['API_2_PDF_KEY']
        },
        stream_body: true
      }
    )
  end
end
