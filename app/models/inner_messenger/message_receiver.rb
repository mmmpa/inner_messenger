module InnerMessenger
  class MessageReceiver < ApplicationRecord
    belongs_to :message, inverse_of: :message_receiver

    validates :message,
              presence: true

    validate -> { !!receiver }

    def receiver
      Receiver.find(receiver_id)
    end

    def receiver=(value)
      id = Receiver.pick_id(value)
      Receiver.find()
      self.receiver_id = Receiver.pick_id(value)
    end
  end
end
