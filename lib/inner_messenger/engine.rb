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

    initializer 'deploy inner messenger configuration' do |app|
      InnerMessenger::Engine.deploy_configuration
    end

    class << self
      def configuration
        @configuration ||= ActiveSupport::OrderedOptions.new
      end

      def scope(klass)
        configuration.scope = klass
      end

      def configure(&block)
        @config = -> { instance_eval &block }
      end

      def configure!(&block)
        configure(&block)
        deploy_configuration
      end

      def deploy_configuration
        @config && @config.()
      end
    end
  end
end

ActiveSupport.run_load_hooks :inner_messenger_engine, InnerMessenger::Engine
