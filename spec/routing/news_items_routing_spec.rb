require "spec_helper"

describe NewsItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/news_items").should route_to("news_items#index")
    end

    it "routes to #new" do
      get("/news_items/new").should route_to("news_items#new")
    end

    it "routes to #show" do
      get("/news_items/1").should route_to("news_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/news_items/1/edit").should route_to("news_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/news_items").should route_to("news_items#create")
    end

    it "routes to #update" do
      put("/news_items/1").should route_to("news_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/news_items/1").should route_to("news_items#destroy", :id => "1")
    end

  end
end
