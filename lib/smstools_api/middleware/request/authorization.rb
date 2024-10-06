require "faraday/middleware"

module SmstoolsApi
  # @private
  module Middleware
    # @private
    module Request
      class Authorization < Faraday::Middleware

        ACCEPT = "accept".freeze
        CLIENTID = "x-client-id".freeze
        CLIENTSECRET = "X-Client-Secret".freeze

        attr_reader :client

        def initialize(app, client)
          super(app)
          @client = client
        end

        def call(env)
          env.request_headers[ACCEPT] = "application/json"
          env.request_headers[CLIENTID] = client.config.client_id
          env.request_headers[CLIENTSECRET] = client.config.client_secret
          @app.call(env)
        end
      end
    end
  end
end
