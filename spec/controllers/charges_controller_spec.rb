require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_wiki) { create(:wiki) }

  describe "GET #new" do
    before do
      sign_in my_user
    end

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
