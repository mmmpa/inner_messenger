module InnerMessenger
  class Owner
    extend Identifier

    def self.find(id)
      find_sender(id)
    end
  end
end
