require 'rails_helper'

module InnerMessenger
  describe 'owner' do
    before { Rails.application.config.inner_messenger.scope = TestInnerMessengerScope }
    context 'identify' do
      subject { Receiver.find_sender(1).id }
      it { should eq(1) }
    end
  end
end
