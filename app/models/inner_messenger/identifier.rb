module InnerMessenger
  module Identifier
    def scope
      @scope ||= Rails.application.config.inner_messenger.scope.new
    end

    def pick_id(instance)
      scope.identifier(instance)
    end

    def receivers
      scope.receivers
    end

    def find_receiver(identifier)
      scope.receiver(identifier)
    end

    def find_sender(identifier)
      scope.sender(identifier)
    end

    class NotFound < StandardError
      def initialize(error = nil)
        @raw_error = error
      end

      def raw_error
        @raw_error
      end
    end
  end
end
