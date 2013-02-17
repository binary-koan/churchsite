require 'spec_helper'

describe AdminController do

  describe "GET 'dashboard'" do
    it "returns http success" do
      get 'dashboard'
      response.should be_success
    end
  end

  describe "GET 'options'" do
    it "returns http success" do
      get 'options'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'users'" do
    it "returns http success" do
      get 'users'
      response.should be_success
    end
  end

end
