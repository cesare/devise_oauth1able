module DeviseOauth1able
  module InternalHelpers
    extend ActiveSupport::Concern
    
    def self.define_oauth1_helpers(name) #:nodoc:
      alias_method(name, :callback_action)
      public name
    end

    included do
      # helpers = %w(oauth_callback oauth_provider oauth_config)
      # hide_action *helpers
      # helper_method *helpers
      # before_filter :valid_oauth_callback?, :oauth_error_happened?
    end
    
    private
    
    def callback_action
      # TODO implement
    end
    
    
    def expire_session_data_after_sign_in!
      super
      session.keys.grep(/_request_token/).each { |k| session.delete(k) }
    end
  end
end