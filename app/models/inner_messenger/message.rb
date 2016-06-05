module InnerMessenger
  class Message < ApplicationRecord
    has_many :message_receivers, dependent: :destroy, inverse_of: :message

    validates :owner_id, :body,
              presence: true

    validate :owner_existence

    before_validation :add_receivers

    def save(*)
      raise CannotUpdate if persisted?
      super
    end

    def receivers=(value)
      @receivers = Array(value)
    end

    def add_receivers
      @receivers && @receivers.each do |receiver|
        message_receivers.build(message: self, receiver: receiver)
      end
    end

    def owner
      Owner.find(owner_id)
    end

    def owner_existence
      !owner && errors.add(:owner, :blank)
    end

    def owner=(value)
      self.owner_id = value.nil? ? nil : Owner.pick_id(value)
    end

    def receivers
      message_receivers(true).pluck(:receiver_id).map { |id|
        Receiver.find(id)
      }.compact
    end

    class CannotUpdate < StandardError

    end
  end
end
