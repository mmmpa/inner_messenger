require 'rails_helper'

module InnerMessenger
  describe 'receiver' do
    before { InnerMessenger::Engine.configure! { scope TestInnerMessengerScope } }
    context 'identify' do
      subject { Receiver.find_receiver(1).id }
      it { should eq(1) }
    end
  end
end
