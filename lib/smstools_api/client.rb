# frozen_string_literal: true

require 'smstools_api/middleware/response/hashie_json'
require 'smstools_api/middleware/request/authorization'
require 'smstools_api/messages'
require 'smstools_api/voice_messages'

module SmstoolsApi
  class Client
    extend Forwardable

    attr_reader :config, :messages, :voice_messages

    def initialize(config = {})
      @config = Hashie::Mash.new(config)
      @messages = Messages.new(self)
      @voice_messages = VoiceMessages.new(self)
    end

    private

    delegate %i[get post put delete head patch options trace] => :connection

    def connection
      @connection ||= build_connection
    end

    def build_connection
      Faraday.new('https://api.smsgatewayapi.com/v1') do |builder|
        # Request
        builder.request :json
        builder.use SmstoolsApi::Middleware::Request::Authorization, self

        # Response
        builder.use SmstoolsApi::Middleware::Response::HashieJson, self
      end
    end
  end
end
