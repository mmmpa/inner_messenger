require 'inner_messenger/public'
require 'inner_messenger/configuration'

module InnerMessenger
  class Engine < ::Rails::Engine
    isolate_namespace InnerMessenger
    extend Public


    config.generators do |g|
      g.assets false
      g.helper false
      g.view false

      g.test_framework :rspec, fixtures: true, view_specs: false, helper_specs: false, routing_specs:
        false, controller_specs: true, request_specs: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    config.inner_messenger = ActiveSupport::OrderedOptions.new

    initializer :set_inner_messenger_scope do
      p :initialize
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
