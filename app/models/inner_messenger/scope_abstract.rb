module InnerMessenger
  module ScopeAbstract
    def klass
      raise ImplementRequired
    end

    def identifier(instance)
      instance.id
    end

    def sender(identifier)
      klass.find(identifier)
    end

    def receivers
      klass.where('id > 0')
    end

    def receiver(identifier)
      receivers.find(identifier)
    end

    class ImplementRequired < StandardError

    end
  end
end