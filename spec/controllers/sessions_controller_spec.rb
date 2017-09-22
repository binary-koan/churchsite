require "rails_helper"

describe SessionsController do
  include Devise::Test::ControllerHelpers

  describe "#new" do
    context "when SECURE_SITE_DOMAIN is set" do
      let(:domain) { "secure.test.com" }

      before do
        stub_const("Churchsite::SECURE_SITE_DOMAIN", domain)
        request.env["devise.mapping"] = Devise.mappings[:user]
      end

      it "redirects to the secure site sign-in" do
        get :new
        expect(response).to redirect_to "https://#{domain}/users/sign_in"
      end
    end
  end
end
