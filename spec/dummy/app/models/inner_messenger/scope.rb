module InnerMessenger
  class Scope
    include InnerMessenger::ScopeAbstract

    def klass
      Account
    end
  end
end