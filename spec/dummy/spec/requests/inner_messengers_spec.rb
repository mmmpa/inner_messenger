require 'rails_helper'

RSpec.describe "InnerMessengers", :type => :request do
  describe "GET /inner_messengers" do
    it "works! (now write some real specs)" do
      get inner_messenger_path
      expect(response).to have_http_status(200)
    end
  end
end
