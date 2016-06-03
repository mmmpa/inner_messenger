module InnerMessenger
  class MessageReceiver < ApplicationRecord
    belongs_to :message
  end
end
