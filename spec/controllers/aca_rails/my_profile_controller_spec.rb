require 'rails_helper'

module AcaRails
  RSpec.describe MyProfileController, type: :controller do

    describe "GET #edit" do
      it "returns http success" do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end

  end
end
