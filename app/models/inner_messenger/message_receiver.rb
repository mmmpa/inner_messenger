module InnerMessenger
  class MessageReceiver < ApplicationRecord
    belongs_to :message, inverse_of: :message_receivers

    validates :receiver_id, :message,
              presence: true

    validate -> { !!receiver }

    def receiver
      Receiver.find(receiver_id)
    end

    def receiver=(value)
      self.receiver_id = Receiver.pick_id(value)
    end
  end
end
