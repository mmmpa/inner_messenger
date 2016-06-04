module InnerMessenger
  class Configuration
    def set(&block)
      instance_eval(&block)
      self
    end

    def method_missing(name, &block)
      super unless Normalizer.method_defined?(name)
      proc_store[name] = block
    end

    def proc_store
      @proc_store ||= ActiveSupport::OrderedOptions.new
    end

    def normalizer
      @normalizer ||= Normalizer.new(self)
    end

    private

    class Normalizer
      def initialize(config = nil)
        @proc = config.proc_store
      end

      def klass
        @klass ||= begin
          base = @proc.klass.()
          String === base ? base.constantize : base
        end
      end

      def sender(identifier)
        @proc.sender.(klass, identifier)
      end

      def receivers
        @proc.receivers.(klass)
      end

      def receiver(identifier)
        @proc.receiver.(receivers, identifier)
      end

      def identify(identifier)
        @proc.identify.(klass, identifier)
      end

      def identifier(instance)
        @proc.identifier.(instance)
      end
    end
  end
end