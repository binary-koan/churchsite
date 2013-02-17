require "spec_helper"

describe CommunityPagesController do
  describe "routing" do

    it "routes to #index" do
      get("/community_pages").should route_to("community_pages#index")
    end

    it "routes to #new" do
      get("/community_pages/new").should route_to("community_pages#new")
    end

    it "routes to #show" do
      get("/community_pages/1").should route_to("community_pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/community_pages/1/edit").should route_to("community_pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/community_pages").should route_to("community_pages#create")
    end

    it "routes to #update" do
      put("/community_pages/1").should route_to("community_pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/community_pages/1").should route_to("community_pages#destroy", :id => "1")
    end

  end
end
