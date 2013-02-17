require 'spec_helper'

describe "Sermons" do
  describe "GET /sermons" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sermons_path
      response.status.should be(200)
    end
  end
end
