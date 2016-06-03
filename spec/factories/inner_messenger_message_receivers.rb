FactoryGirl.define do
  factory :inner_messenger_message_receiver, class: 'InnerMessenger::MessageReceiver' do
    message nil
    receiver_id 1
    state 1
  end
end
