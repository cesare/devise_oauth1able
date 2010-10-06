class Devise::Oauth1Controller < ApplicationController
  include Devise::Controllers::InternalHelpers
  include DeviseOauth1able::InternalHelpers
  
  before_filter :find_config_for_provider, :setup_consumer
  
  
  def go
    request_token = find_request_token || get_request_token
    redirect_to request_token.authorize_url
  end
  
  def callback
    request_token = find_request_token
    @access_token = request_token.get_access_token(:oauth_token => params[:oauth_token], :oauth_verifier => params[:oauth_verifier])
    
    self.resource = resource_class.send(oauth_model_callback, @access_token)
    if resource.persisted? && resource.errors.empty?
      # set_oauth_flash_message :notice, :success
      sign_in_and_redirect resource_name, resource, :event => :authentication
    else
      # session[oauth_session_key] = access_token.token
      # clean_up_passwords(resource)
      render_for_oauth1
    end
  end
  
  
  #
  # filters
  #
  private
  
  def find_config_for_provider
    @provider = params[:provider].to_sym
    @config = resource_class.oauth1_configs[@provider]
  end
  
  def setup_consumer
    @consumer = @config.consumer
  end
  
  #
  # helpers
  #
  private
  
  def find_request_token
    token  = session[request_token_name_for(@provider)]
    secret = session[request_token_secret_name_for(@provider)]
    if token && secret
      OAuth::RequestToken.new(@consumer, token, secret)
    else
      nil
    end
  end
  
  def get_request_token
    token = @consumer.get_request_token(:oauth_callback => callback_url_for(@provider))
    session[request_token_name_for(@provider)] = token.token
    session[request_token_secret_name_for(@provider)] = token.secret
    token
  end
  
  def request_token_name_for(provider)
    "#{provider}_request_token".to_sym
  end
  
  def request_token_secret_name_for(provider)
    "#{provider}_request_token_secret".to_sym
  end
  
  def callback_url_for(provider)
    user_oauth1_callback_url(:provider => provider)
  end
  
  def oauth_model_callback
    "find_for_#{@provider}_oauth1"
  end
end
