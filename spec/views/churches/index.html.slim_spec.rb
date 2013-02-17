require 'spec_helper'

describe "churches/index" do
  before(:each) do
    assign(:churches, [
      stub_model(Church,
        :image => "Image",
        :name => "Name",
        :services_description => "Services Description",
        :address => "Address",
        :map_address => "Map Address"
      ),
      stub_model(Church,
        :image => "Image",
        :name => "Name",
        :services_description => "Services Description",
        :address => "Address",
        :map_address => "Map Address"
      )
    ])
  end

  it "renders a list of churches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Services Description".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Map Address".to_s, :count => 2
  end
end
