module InnerMessenger
  class Scope
    extend InnerMessenger::ScopeAbstract

    def klass
      Account
    end
  end
end