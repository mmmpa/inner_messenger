module InnerMessenger
  class Configuration
    attr_reader :klass_proc, :identifier_proc, :sendable_proc

    def set(&block)
      instance_eval(&block)
      self
    end

    def klass(&block)
      @klass_proc = block
    end

    def identifier(&block)
      @identifier_proc = block
    end

    def sendable(&block)
      @sendable_proc = block
    end

    def normalizer
      @normalizer ||= Normalizer.new(self)
    end

    private

    class Normalizer
      def initialize(config)
        @config = config
      end

      def klass
        @klass ||= begin
          base = @config.klass_proc.()
          String === base ? base.constantize : base
        end
      end

      def sendable
        @config.sendable_proc.(klass)
      end

      def identifier(record)
        @config.identifier_proc.(record)
      end
    end
  end
end