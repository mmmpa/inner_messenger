module InnerMessenger
  module Public
    def configure(*args, &block)
      configuration.instance_eval &block
    end

  end
end