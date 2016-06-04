require 'inner_messenger/configuration'

module InnerMessenger
  class Engine < ::Rails::Engine
    isolate_namespace InnerMessenger

    config.generators do |g|
      g.assets false
      g.helper false
      g.view false

      g.test_framework :rspec, fixtures: true, view_specs: false, helper_specs: false, routing_specs:
        false, controller_specs: true, request_specs: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    config.inner_messenger = ActiveSupport::OrderedOptions.new
  end
end
