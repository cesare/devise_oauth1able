module DeviseOauth1able
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_controller) { include DeviseOauth1able::Controllers::UrlHelpers }
    ActiveSupport.on_load(:action_view) { include DeviseOauth1able::Controllers::UrlHelpers }
  end
end