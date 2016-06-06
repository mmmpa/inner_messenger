require 'rails_helper'

module InnerMessenger
  RSpec.describe Message, :type => :model do
    before { InnerMessenger::Engine.configure! { scope TestInnerMessengerScope } }

    describe 'validation' do
      let(:message) { build(:inner_messenger_message) }
      subject { message.valid? }

      context 'owner_id' do
        describe 'require' do
          it { should be_truthy }
          it do
            message.owner = nil
            should be_falsey
          end
        end

        describe 'refuse invalid id' do
          it do
            message.owner_id = 300
            should be_falsey
          end
        end
      end

      context 'body' do
        describe 'require' do
          it { should be_truthy }
          it do
            message.body = nil
            should be_falsey
          end
        end
      end
    end

    describe 'scope' do
      before do
        create(:inner_messenger_message, receivers: User.all.second)
        create(:inner_messenger_message, receivers: User.all.third)
      end

      describe 'sent' do
        let(:sent1) { Message.sent_by(User.all.first) }
        let(:sent2) { Message.sent_by(User.all.second) }
        let(:sent3) { Message.sent_by(User.all.third) }

        it { expect(sent1.size).to eq(2) }
        it { expect(sent2.size).to eq(0) }
        it { expect(sent3.size).to eq(0) }
      end

      describe 'received' do
        let(:received1) { Message.received_by(User.all.first) }
        let(:received2) { Message.received_by(User.all.second) }
        let(:received3) { Message.received_by(User.all.third) }

        it { expect(received1.size).to eq(0) }
        it { expect(received2.size).to eq(1) }
        it { expect(received3.size).to eq(1) }
      end
    end

    describe 'association' do
      let(:message) { create(:inner_messenger_message, receivers: User.all[1..3]) }
      subject { message.receivers }

      context 'receivers' do
        it { should eq(User.all[1..3]) }
      end
    end

    describe 'cannot update' do
      let(:message) { create(:inner_messenger_message) }
      it { expect { message.save }.to raise_error(Message::CannotUpdate) }
      it { expect { message.update(body: 'a') }.to raise_error(Message::CannotUpdate) }
    end
  end
end
