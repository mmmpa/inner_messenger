class User
  attr_accessor :id

  class << self
    def all
      @all ||= [new(1), new(2), new(3), new(4)]
    end
  end

  def initialize(id)
    self.id = id
  end
end