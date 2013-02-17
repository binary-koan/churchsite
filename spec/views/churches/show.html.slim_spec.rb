require 'spec_helper'

describe "churches/show" do
  before(:each) do
    @church = assign(:church, stub_model(Church,
      :image => "Image",
      :name => "Name",
      :services_description => "Services Description",
      :address => "Address",
      :map_address => "Map Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    rendered.should match(/Name/)
    rendered.should match(/Services Description/)
    rendered.should match(/Address/)
    rendered.should match(/Map Address/)
  end
end
