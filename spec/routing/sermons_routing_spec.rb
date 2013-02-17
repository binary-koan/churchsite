require "spec_helper"

describe SermonsController do
  describe "routing" do

    it "routes to #index" do
      get("/sermons").should route_to("sermons#index")
    end

    it "routes to #new" do
      get("/sermons/new").should route_to("sermons#new")
    end

    it "routes to #show" do
      get("/sermons/1").should route_to("sermons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sermons/1/edit").should route_to("sermons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sermons").should route_to("sermons#create")
    end

    it "routes to #update" do
      put("/sermons/1").should route_to("sermons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sermons/1").should route_to("sermons#destroy", :id => "1")
    end

  end
end
