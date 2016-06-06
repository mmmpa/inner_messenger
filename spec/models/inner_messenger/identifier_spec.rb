require 'rails_helper'

module InnerMessenger
  describe 'identifier' do
    before { InnerMessenger::Engine.configure! { scope TestInnerMessengerScope } }
    context 'identify' do
      subject { DummyIdentifier.receivers.first.id }
      it { should eq(1) }
    end
  end

  class DummyIdentifier
    extend Identifier
  end
end

