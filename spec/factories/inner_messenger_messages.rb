FactoryGirl.define do
  factory :inner_messenger_message, class: 'InnerMessenger::Message' do
    owner_id "MyString"
  end
end
