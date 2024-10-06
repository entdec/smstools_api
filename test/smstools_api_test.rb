require 'test_helper'

class SmstoolsApiTest < Minitest::Test
  def setup
    @client = SmstoolsApi::Client.new(client_id: ENV['CLIENT_ID'],
                                      client_secret: ENV['CLIENT_SECRET'])
  end

  def test_that_it_has_a_version_number
    refute_nil ::SmstoolsApi::VERSION
  end

  def test_we_can_send_an_sms
    VCR.use_cassette('messages') do
      response = @client.messages.create(to: '+3161245678', message: 'Hello this is a test message!',
                                         sender: 'RubySDK')
      assert response.body.messageid

      assert_equal 200, response.status
    end
  end

  def test_we_can_send_voice_messages
    VCR.use_cassette('voice_messages') do
      response = @client.voice_messages.create(to: '+3161245678', message: 'Hello this is a test message!',
                                               sender: 'Ruby SDK')
      assert response.body.messageid

      assert_equal 200, response.status
    end
  end
end
