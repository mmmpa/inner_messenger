require 'rails_helper'

module InnerMessenger
  RSpec.describe MessagesController, :type => :controller do

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET create" do
      it "returns http success" do
        get :create
        expect(response).to have_http_status(:success)
      end
    end

  end
end
