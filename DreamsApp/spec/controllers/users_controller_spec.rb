require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders new user template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    # before(:each) { post :create, params: {user: FactoryBot.attributes_for(:user)} }
    context "with valid params" do
      it "logs in the user" do
        post :create, params: {user: FactoryBot.attributes_for(:user)}
        expect(session[:session_token]).to eq(User.last.session_token)
      end
    end
  end
end
