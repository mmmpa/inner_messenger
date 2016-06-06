module InnerMessenger
  class MailBox
    class << self
      def open(owner)
        MailBox.new owner
      end
    end

    def initialize(owner)
      @owner = owner
    end

    def sent
      Message.sent_by(@owner)
    end

    def received
      Message.received_by(@owner)
    end
  end
end