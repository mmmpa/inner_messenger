module InnerMessenger
  class User
    extend Identifier

    def self.find(id)
      find_user(id)
    end
  end
end
