def mock_api_2_pdf
  stub_request(:get, "#{ENV['API_2_PDF_URL']}/chrome/url?apikey=#{ENV['API_2_PDF_KEY']}&url=#{url}").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Ruby'
      }).
    to_return(status: 200, body: "Example PDF response", headers: {})
end
