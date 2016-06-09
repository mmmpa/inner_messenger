require 'rails_helper'

module InnerMessenger
  describe 'mail' do
    before { InnerMessenger::Engine.configure! { scope TestInnerMessengerScope } }

    describe 'deliver' do
      let(:user1) { User.all[0] }
      let(:user2) { User.all[1] }
      let(:body) { SecureRandom.hex(4) }
      let(:message) { Message.all.last }

      before do
        Mail.from(user1).to(user2).deliver(body)
      end

      it { expect(message.body).to eq(body) }
      it { expect(message.owner.id).to eq(user1.id) }
      it { expect(message.receivers.first.id).to eq(user2.id) }
    end
  end
end

