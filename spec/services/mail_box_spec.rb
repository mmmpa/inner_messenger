require 'rails_helper'

module InnerMessenger
  describe 'mail box' do
    before { InnerMessenger::Engine.configure! { scope TestInnerMessengerScope } }

    let(:user1) { User.all.first }
    let(:user2) { User.all.second }
    let(:user3) { User.all.third }
    let(:mailbox1) { MailBox.open(user1) }
    let(:mailbox2) { MailBox.open(user2) }
    let(:mailbox3) { MailBox.open(user3) }

    before do
      create(:inner_messenger_message, receivers: User.all.second)
      create(:inner_messenger_message, receivers: User.all.third)
    end

    describe 'sent' do
      it { expect(mailbox1.sent.size).to eq(2) }
      it { expect(mailbox2.sent.size).to eq(0) }
      it { expect(mailbox3.sent.size).to eq(0) }
    end

    describe 'received' do
      it { expect(mailbox1.received.size).to eq(0) }
      it { expect(mailbox2.received.size).to eq(1) }
      it { expect(mailbox3.received.size).to eq(1) }
    end
  end
end

