require 'oauth'

module DeviseOauth1able
  class Config
    attr_accessor :consumer
    
    def initialize(key, secret, options)
      @consumer = OAuth::Consumer.new(key, secret, options)
    end
    
    # def authorize_url(options)
    #   request_token = consumer.get_request_token
    #   # TODO save the request_token to the database
    #   request_token.authorize_url
    # end
    
  end
end