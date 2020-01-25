def mock_api_2_pdf
  endpoint = Regexp.new("#{ENV['API_2_PDF_URL']}/chrome/url", "i")
  stub_request(:get, endpoint).
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Ruby'
      }).
    to_return(status: 200, body: "Example PDF response", headers: {})
end
