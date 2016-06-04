module InnerMessenger
  class Message < ApplicationRecord
    has_many :message_receivers, dependent: :destroy, inverse_of: :message

    validates :owner_id, :body,
              presence: true

    validate -> { !!owner }

    def owner
      Owner.identify(owner_id)
    end

    def owner=(value)
      self.owner_id = Owner.pick_id(value)
    end

    def receivers
      Receiver.select(message_receivers.pluck(:receiver_id))
    end
  end
end
