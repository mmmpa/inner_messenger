class User
  attr_accessor :id

  class << self
    def where(*)
      all
    end

    def all
      @all ||= [new(1), new(2), new(3), new(4)]
    end

    def select(id)
      if Array === id
        all.select { |u| u.id.in? id }
      else
        all.select { |u| u.id == id }
      end
    end

    def find(id)
      select(id).first
    end
  end

  def initialize(id)
    self.id = id
  end
end