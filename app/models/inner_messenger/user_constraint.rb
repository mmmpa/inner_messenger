module InnerMessenger
  class UserConstraint
    extend Identifier

    def self.matches?(request)
      !!find_user(request.params[:user_id])
    end
  end
end