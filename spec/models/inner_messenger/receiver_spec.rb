require 'rails_helper'

module InnerMessenger
  describe 'receiver' do
    before { Rails.application.config.inner_messenger.scope = TestInnerMessengerScope }
    context 'identify' do
      subject { Receiver.find_receiver(1).id }
      it { should eq(1) }
    end
  end
end
