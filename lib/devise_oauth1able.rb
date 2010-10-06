module Devise
  # autoload :Oauth, 'devise/oauth'
  
  mattr_accessor :oauth1_providers
  @@oauth1_providers = []
  
  mattr_reader :oauth1_configs
  @@oauth1_configs = ActiveSupport::OrderedHash.new
  
  mattr_reader :oauth1_helpers
  @@oauth1_helpers = Set.new
  
  
  def self.oauth1(provider, *args)
    @@helpers << DeviseOauth1able::Controllers::UrlHelpers
    @@oauth1_helpers << DeviseOauth1able::InternalHelpers

    @@oauth1_providers << provider
    @@oauth1_providers.uniq!

    @@oauth1_helpers.each { |h| h.define_oauth1_helpers(provider) }
    @@oauth1_configs[provider] = DeviseOauth1able::Config.new(*args)
  end
end

Devise.add_module :oauth1able, :controller => :oauth1, :model => 'devise_oauth1able/model', :route => :oauth1

require 'devise_oauth1able/rails'
require 'devise_oauth1able/model'
require 'devise_oauth1able/routes'
require 'devise_oauth1able/config'
require 'devise_oauth1able/internal_helpers'
require 'devise_oauth1able/controllers/url_helpers'
