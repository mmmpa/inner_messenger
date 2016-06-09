module InnerMessenger
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def user
      User.find(params[:user_id])
    end
  end
end
