module InnerMessenger
  class Receiver
    extend Identifier

    def self.find(id)
      find_receiver(id)
    end
  end
end
