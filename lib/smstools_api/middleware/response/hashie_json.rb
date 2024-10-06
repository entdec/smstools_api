module SmstoolsApi
  # @private
  module Middleware
    # @private
    module Response
      class HashieJson < Faraday::Middleware
        CONTENT_TYPE = "Content-Type".freeze

        def initialize(app, client)
          super(app)
          @client = client
        end

        def on_complete(env)
          type = env[:response_headers][CONTENT_TYPE].to_s
          type = type.split(";", 2).first if type.index(";")

          return unless type == "application/json"

          unless env[:body].strip.empty?
            env[:body] = Hashie::Mash.new(JSON.parse(env[:body]))
          end
        end
      end
    end
  end
end
