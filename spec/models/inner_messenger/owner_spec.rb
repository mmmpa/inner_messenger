require 'rails_helper'

module InnerMessenger
  describe 'owner' do
    before { InnerMessenger::Engine.configure! { scope TestInnerMessengerScope } }
    context 'identify' do
      subject { Receiver.find_sender(1).id }
      it { should eq(1) }
    end
  end
end
