module InnerMessenger
  class Owner
    extend Identifier

    def find(id)
      find_sender(id)
    end
  end
end
