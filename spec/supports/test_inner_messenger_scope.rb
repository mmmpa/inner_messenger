class TestInnerMessengerScope
  include InnerMessenger::ScopeAbstract

  def klass
    User
  end

  def receiver(identifier)
    receivers.find { |r| r.id == identifier }
  end
end