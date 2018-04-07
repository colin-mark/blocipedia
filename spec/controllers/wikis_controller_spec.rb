require 'rails_helper'
require 'spec_helper'
include RandomData
include SessionsHelper

RSpec.describe WikisController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_wiki) { create(:wiki) }

  context "member user doing crud" do
    before do
      sign_in my_user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns Wiki.all to @wikis" do
        get :index
        expect(assigns(:wikis)).to eq([my_wiki])
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, params: { id: my_wiki.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: { id: my_wiki.id }
        expect(response).to render_template :show
      end

      it "assigns my_wiki to @wiki" do
        get :show, params: { id: my_wiki.id }
        expect(assigns(:wiki)).to eq(my_wiki)
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "initializes @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of wikis by 1" do
        expect{ post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph, private: RandomData.random_boolean } } }.to change(Wiki,:count).by(1)
      end

      it "assigns Wiki.last to @wiki" do
        post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph, private: RandomData.random_boolean } }
        expect(assigns(:wiki)).to eq(Wiki.last)
      end

      it "redirects to the new wiki" do
        post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph, private: RandomData.random_boolean } }
        expect(response).to redirect_to Wiki.last
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, params: { id: my_wiki.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph
        new_boolean = RandomData.random_boolean

        put :update, params: { id: my_wiki.id, wiki: { title: new_title, body: new_body, private: new_boolean } }
        expect(response).to redirect_to(my_wiki)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, params: { id: my_wiki.id }
        expect(response).to redirect_to(wikis_path)
      end
    end
  end
end
