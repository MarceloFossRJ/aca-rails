require 'rails_helper'

module AcaRails
  RSpec.describe PasswordResetsController, type: :controller do

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

  end
end
