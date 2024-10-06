module SmstoolsApi
  class VoiceMessages
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def create(message:, to:, sender:, date: nil, reference: nil, language: nil, gender: nil, test: false)
      @client.post('voice/send', to: to, message: message, sender: sender)
    end
  end
end
