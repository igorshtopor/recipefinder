require File.expand_path '../../app.rb', __FILE__
require 'minitest/autorun'
require 'rack/test'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert_match 'Recipe finder', last_response.body
  end

  #TODO: use vcr
  def test_fetch
    get '/fetch'
    assert_match 'Ginger Champagne', last_response.body
  end
end
