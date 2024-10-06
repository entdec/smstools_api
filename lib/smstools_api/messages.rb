module SmstoolsApi
  class Messages
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def create(message:, to:, sender:, date: nil, reference: nil, test: false, subid: nil)
      @client.post('message/send', to: to, message: message, sender: sender)
    end
  end
end
