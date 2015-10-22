require './test/test_helper'

class ViewDetailsTest < FeatureTest
  include Rack::Test::Methods

  def setup
    post '/sources', { "identifier" => "jumpstartlab",
                       "rootUrl" => "http://jumpstartlab.com" }
    post '/sources/jumpstartlab/data', {"payload"=> "{\"url\":\"http://jumpstartlab.com/blog\",
                    \"requestedAt\":\"2013-02-16 21:38:28 -0700\",
                    \"respondedIn\":37,
                    \"referredBy\":\"http://jumpstartlab.com\",
                    \"requestType\":\"GET\",
                    \"parameters\":[],
                    \"eventName\": \"socialLogin\",
                    \"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17\",
                    \"resolutionWidth\":\"1920\",
                    \"resolutionHeight\":\"1280\",
                    \"ip\":\"63.29.38.211\"}",
                    "splat"=>[],
                    "captures"=>["jumpstartlab"],
                    "identifier"=>"jumpstartlab"}
    post '/sources/jumpstartlab/data', {"payload"=> "{\"url\":\"http://jumpstartlab.com/team\",
                    \"requestedAt\":\"2013-02-16 21:38:28 -0700\",
                    \"respondedIn\":37,
                    \"referredBy\":\"http://jumpstartlab.com\",
                    \"requestType\":\"GET\",
                    \"parameters\":[],
                    \"eventName\": \"socialLogin\",
                    \"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17\",
                    \"resolutionWidth\":\"1920\",
                    \"resolutionHeight\":\"1280\",
                    \"ip\":\"63.29.38.211\"}",
                    "splat"=>[],
                    "captures"=>["jumpstartlab"],
                    "identifier"=>"jumpstartlab"}
  end

  def test_user_can_view_all_data_at_homepage
    visit '/sources/jumpstartlab'
    assert page.has_content?("Requested URLs")
  end

  def test_user_registered_with_no_payload

  end

  def test_unregistered_user_returns_error_message

  end

end
