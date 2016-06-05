FactoryGirl.define do
  factory :inner_messenger_message, class: 'InnerMessenger::Message' do
    owner_id { User.all.first.id }
    body { SecureRandom.hex(4) }
  end
end
