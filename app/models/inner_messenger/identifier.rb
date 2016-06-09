module InnerMessenger
  module Identifier
    def scope
      @scope = InnerMessenger::Engine.configuration.scope.new
    end

    def pick_id(instance)
      scope.identifier(instance)
    end

    def receivers
      scope.receivers
    end

    def find_user(identifier)
      scope.user(identifier)
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
