module InnerMessenger
  class Mail
    class << self
      def from(sender)
        Deliverer.new.from sender
      end
    end

    private

    class Deliverer
      def from(sender)
        @sender = sender
        self
      end

      def to(receivers)
        @receivers = Array(receivers)
        self
      end

      def deliver(message)
        Message.create!(owner: @sender, receivers: @receivers, body: message)
      end
    end
  end
end