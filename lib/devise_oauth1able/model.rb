module Devise
  module Models
    module Oauth1able
      extend ActiveSupport::Concern

      module ClassMethods
        def oauth1_configs #:nodoc:
          Devise.oauth1_configs.slice(*oauth1_providers)
        end

        # def oauth1_access_token(provider, token)
        #   oauth1_configs[provider].access_token_by_token(token)
        # end

        Devise::Models.config(self, :oauth1_providers)
      end
    end
  end
end