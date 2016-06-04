module InnerMessenger
  class Receiver
    extend Identifier

    def find(id)
      find_receiver(id)
    end
  end
end
