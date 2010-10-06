module ActionDispatch::Routing
  class Mapper
    protected
      def devise_oauth1(mapping, controllers)
        get "/oauth1/:provider",
          :provider => Regexp.union(mapping.to.oauth1_providers.map(&:to_s)),
          :action => :go,
          :to => controllers[:oauth1],
          :as => :oauth1
        
        get "/oauth1/:provider/callback",
          :action => Regexp.union(mapping.to.oauth1_providers.map(&:to_s)),
          :action => :callback,
          :to => controllers[:oauth1],
          :as => :oauth1_callback
      end
  end
end
