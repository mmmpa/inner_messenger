require 'rails_helper'

module InnerMessenger
  RSpec.describe Message, :type => :model do
    before { Rails.application.config.inner_messenger.scope = TestInnerMessengerScope }

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
