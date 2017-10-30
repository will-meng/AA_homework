require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        get :create, params: { user: { email: 'a@b.com' } }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        get :create, params: { user: { email: 'a@b.com', password: 'abcde' } }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects user to bands index on success" do
        get :create, params: { user: { email: 'a@b.com', password: 'abcdef' } }
        expect(response).to redirect_to(user_url(User.last.id))
      end
    end
  end
end
