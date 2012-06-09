module Obviews
  class Railtie < Rails::Railtie
    config.obviews = ActiveSupport::OrderedOptions.new
    # config.obviews.memoize_by_default = true
      
      
    initializer 'obviews.initialize' do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send :include, ::Obviews::Controller
      end
      
      ActiveSupport.on_load(:action_view) do
        ActionView::Base.send :include, ::Obviews::View
      end
    end
  end
end