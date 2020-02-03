require 'webmock/rspec'

RSpec.configure do |config|
  WebMock.disable_net_connect!({
    allow_localhost: true,
    allow: ['chromedriver.storage.googleapis.com', 'github.com']
  })
end
